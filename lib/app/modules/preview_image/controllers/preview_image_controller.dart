import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/data/models/photo.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:photoframer/app/projects_controller.dart';
import 'package:photoframer/app/routes/app_pages.dart';
import 'package:photoframer/app/widgets/coordinates_converter.dart';

import 'package:share_plus/share_plus.dart';

class PreviewImageController extends GetxController
    with GetTickerProviderStateMixin {
  // GlobalKey globalKey = GlobalKey();
  Project? project;
  // Project? prevProject;
  // Project? nextProject;
  RxString errorText = "".obs;
  RxBool isLiked = false.obs;
  final phyToLogRatio = Get.mediaQuery.devicePixelRatio;
  late ColorScheme currentColorSchemeLight;
  late ColorScheme currentColorSchemeDark;
  late ColorCombination colorCombination;

  late TextEditingController titleController;
  late TextEditingController contentController;
  late TabController tabController;

  late AnimationController colorController;
  late Animation<double> colorAnimation;
  late Animation<double> alphaAnimation;

  List<CellData> matrixValues =
      List<CellData>.generate(20, (index) => CellData(value: 0.0, index: index))
          .obs;

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? pickedFile = await _pickImage(picker);
      if (pickedFile == null) {
        print("No Image Selected");
        return;
      }

      await _processImage(pickedFile);
    } catch (error) {
      print("Error picking image: $error");
    }
  }

  Future<XFile?> _pickImage(ImagePicker picker) async {
    try {
      return await picker.pickImage(
          source: ImageSource.gallery, maxWidth: 1080);
    } catch (e) {
      picker.printError();
      rethrow;
    }
  }

  void updateProjectContent() {
    project!.title = titleController.text;
    project!.content = contentController.text;
    project!.updatedDate = DateTime.now();
    ProjectListController.to.updateProject(project!);
  }

  Future<void> _processImage(XFile pickedFile) async {
    final File imageFile = File(pickedFile.path);
    final fileBytes = imageFile.readAsBytesSync();
    final data = await readExifFromBytes(fileBytes);
    var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());

    GPSData gpsData = await CoordinatesConverter.getGPSData(data);
    project = Project(
      photo: Photo.fromIfdTag(pickedFile.path, data, decodedImage.width,
          decodedImage.height, gpsData),
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
    );

    //Get
    ProjectListController.to.addProject(project!);
    getToProjects(project!);
  }

  shareImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await (image.toByteData(format: ui.ImageByteFormat.png));
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final now = DateTime.now();
      final formattedDateTime = DateFormat('yyyyMMddHHmmss').format(now);

      final imagePath =
          await File('${appDocumentsDir.path}/$formattedDateTime.png').create();
      await imagePath.writeAsBytes(pngBytes);
      // print(formattedDateTime);

      // Share Plugin
      final XFile imageFile =
          XFile('${appDocumentsDir.path}/$formattedDateTime.png');
      await Share.shareXFiles([imageFile]);
    } catch (e) {
      errorText.value = "Error: $e";
    }
  }

  Future<void> updateColorScheme(ImageProvider provider) async {
    await ColorScheme.fromImageProvider(
            provider: provider, brightness: Brightness.light)
        .then((value) {
      currentColorSchemeLight = value;
    });
    await ColorScheme.fromImageProvider(
            provider: provider, brightness: Brightness.dark)
        .then((value) {
      currentColorSchemeDark = value;
    });
  }

  void updateBackgroundColor(int index) {
    colorCombination.background = getColor(index)("background");
    colorCombination.title = getColor(index)("title");
    colorCombination.text = getColor(index)("text");
    update(['image']);
  }

  Color getBackgroundColor(int index) {
    return getColor(index)(null);
  }

  Color Function(String? entities) getColor(int index) {
    Color getEntityColor(
        {String? entities, required Color background, required Color text}) {
      switch (entities) {
        case "background":
          return background;
        case "title":
          return text;
        case "text":
          return text.withOpacity(0.8);
        default:
          return background;
      }
    }

    switch (index) {
      case 0:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: Theme.of(Get.context!).colorScheme.background,
            text: Theme.of(Get.context!).colorScheme.onBackground);
      case 1:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: Theme.of(Get.context!).colorScheme.onBackground,
            text: Theme.of(Get.context!).colorScheme.background);
      case 2:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeLight.primary,
            text: currentColorSchemeLight.onPrimary);
      case 3:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeDark.primary,
            text: currentColorSchemeDark.onPrimary);
      case 4:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeLight.secondary,
            text: currentColorSchemeLight.onSecondary);
      case 5:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeDark.secondary,
            text: currentColorSchemeDark.onSecondary);
      case 6:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeLight.tertiary,
            text: currentColorSchemeLight.onTertiary);
      case 7:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: currentColorSchemeDark.tertiary,
            text: currentColorSchemeDark.onTertiary);
      default:
        return (String? entities) => getEntityColor(
            entities: "background",
            background: Theme.of(Get.context!).colorScheme.background,
            text: Theme.of(Get.context!).colorScheme.onBackground);
    }
  }

  void getToProjects(Project currentProject) async {
    project = currentProject;
    await updateColorScheme(
        FileImage(File(currentProject.photo.imageFilePath!)));
    titleController.text = currentProject.title ?? "";
    contentController.text = currentProject.content ?? "";
    isLiked.value = currentProject.tags?.contains("favourite") ?? false;

    // prevProject =
    //     await ProjectListController.to.getProject(currentProject.id - 1);
    // nextProject =
    //     await ProjectListController.to.getProject(currentProject.id + 1);

    update(['image']);
    Get.toNamed(Routes.PREVIEW_IMAGE);
    // colorController.reset();
    // colorController.forward();
  }

  bool toggleFavourite() {
    if (!isLiked.value) {
      project!.tags?.add("favourite");
    } else {
      project!.tags?.remove("favourite");
    }
    isLiked.value = !isLiked.value;
    ProjectListController.to.updateProject(project!);
    // update(['like']);
    return isLiked.value;
  }

  // Future<bool> onLikeButtonTapped(bool isLiked) async {
  //   if (!isLiked) {
  //     project!.tags?.add("favourite");
  //   } else {
  //     project!.tags?.remove("favourite");
  //   }
  //   ProjectListController.to.updateProject(project!);
  //   // update(['like']);
  //   return !isLiked;
  // }

  GlobalKey getKey() {
    switch (tabController.index) {
      case 0:
        return TemplateKeys.template1;
      case 1:
        return TemplateKeys.template2;
      case 2:
        return TemplateKeys.template3;
      default:
        return TemplateKeys.template1;
    }
  }

  void upDateMatrixValues(List<double> values) {
    assert(values.length == 20);
    for (int i = 0; i < values.length; i++) {
      matrixValues[i].value = values[i];
    }
    update(['image']);
  }

  void getBack() {
    colorCombination = ColorCombination(
        background: Theme.of(Get.context!).colorScheme.background,
        title: Theme.of(Get.context!).colorScheme.onBackground,
        text: Theme.of(Get.context!).colorScheme.onBackground.withOpacity(0.8));
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    currentColorSchemeLight = Theme.of(Get.context!).colorScheme;

    colorCombination = ColorCombination(
        background: currentColorSchemeLight.background,
        title: currentColorSchemeLight.onBackground,
        text: currentColorSchemeLight.onBackground.withOpacity(0.8));

    titleController = TextEditingController();
    contentController = TextEditingController();

    tabController = TabController(length: 3, vsync: this);

    colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    colorAnimation = Tween<double>(begin: 1, end: -1).animate(CurvedAnimation(
        parent: colorController, curve: const Cubic(0.05, 0.7, 0.1, 1.0)));
    alphaAnimation = Tween<double>(begin: 0, end: 255).animate(CurvedAnimation(
        parent: colorController, curve: const Cubic(0.05, 0.7, 0.1, 1.0)));

    List<double> filters = [
      //R  G   B    A  Const
      colorAnimation.value, 0, 0, 0, alphaAnimation.value, //
      0, colorAnimation.value, 0, 0, alphaAnimation.value, //
      0, 0, colorAnimation.value, 0, alphaAnimation.value, //
      0, 0, 0, 1, 0, //
    ];
    upDateMatrixValues(filters);
    colorController.reverse();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Map<String, List<double>> predefinedFilters = {
    'Identity': [
      //R  G   B    A  Const
      1, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
    'Grey Scale': [
      //R  G   B    A  Const
      0.33, 0.59, 0.11, 0, 0, //
      0.33, 0.59, 0.11, 0, 0, //
      0.33, 0.59, 0.11, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
    'Invers': [
      //R  G   B    A  Const
      -1, 0, 0, 0, 255, //
      0, -1, 0, 0, 255, //
      0, 0, -1, 0, 255, //
      0, 0, 0, 1, 0, //
    ],
    'Sepia': [
      //R  G   B    A  Const
      0.393, 0.769, 0.189, 0, 0, //
      0.349, 0.686, 0.168, 0, 0, //
      0.272, 0.534, 0.131, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  };
}

class TemplateKeys {
  static final template1 = GlobalKey();
  static final template2 = GlobalKey();
  static final template3 = GlobalKey();
}

class CellData {
  double value;
  final int index;
  TextEditingController? controller;

  CellData({required this.value, required this.index});
}
