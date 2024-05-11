import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart' as Path;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/data/models/photo.dart';
import 'package:photoframer/app/data/models/post.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/utils/constant.dart';
import 'package:photoframer/app/utils/posts_controller.dart';
import 'package:photoframer/app/utils/projects_controller.dart';
import 'package:photoframer/app/routes/app_pages.dart';
import 'package:photoframer/app/utils/color_utils.dart';
import 'package:photoframer/app/utils/image_utils.dart';
import 'package:photoframer/app/utils/coordinates_converter.dart';
import 'package:share_plus/share_plus.dart';

class PreviewImageController extends GetxController
    with GetTickerProviderStateMixin {
  Project? project;
  RxString errorText = "".obs;

  // final phyToLogRatio = Get.mediaQuery.devicePixelRatio;
  late ColorScheme currentColorSchemeLight;
  late ColorScheme currentColorSchemeDark;
  late ColorCombination colorCombination;

  late TextEditingController titleController;
  late TextEditingController contentController;
  late TabController tabController;
  RxBool isLiked = false.obs;

  late AnimationController colorController;
  late Animation<double> colorAnimation;
  late Animation<double> alphaAnimation;
  late List<MenuIconLabel> menuList;

  List<CellData> matrixValues =
      List<CellData>.generate(20, (index) => CellData(value: 0.0, index: index))
          .obs;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await ImageUtils.pickImage();
    if (pickedFile == null) {
    } else {
      final File imageFile = File(pickedFile.path);
      final fileBytes = imageFile.readAsBytesSync();
      final data = await readExifFromBytes(fileBytes);
      var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());

      GPSData? gpsData = await CoordinatesConverter.getGPSData(data);

      project = Project(
        photo: Photo.fromIfdTag(pickedFile.path, data, decodedImage.width,
            decodedImage.height, gpsData),
        createdDate: DateTime.now(),
        updatedDate: DateTime.now(),
      );
      ProjectListController.to.addProject(project!);
      getToProjects(project!);
    }
  }

  void shareImage(GlobalKey key) async {
    ImageUtils.shareImage(key);
  }

  void downloadImage(
    GlobalKey key,
  ) async {
    if (await ImageUtils.downloadImage(key)) {
      print("Successful");
      Get.back();
      Get.snackbar(
        '',
        '',
        titleText: Text(
          'Successfully downloaded',
          style: Get.context!.titleMedium,
        ),
        forwardAnimationCurve: const Cubic(0.05, 0.7, 0.1, 1.0),
        reverseAnimationCurve: const Cubic(0.3, 0.0, 0.8, 0.15),
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
        colorText: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Icons.check),
      );
    } else {
      print("Failed");
      Get.snackbar(
        '',
        '',
        titleText: Text(
          'Failed downloading',
          style: Get.context!.titleMedium,
        ),
        messageText: Text(
          'Please try again later',
          style: Get.context!.bodyMedium,
        ),
        forwardAnimationCurve: const Cubic(0.05, 0.7, 0.1, 1.0),
        reverseAnimationCurve: const Cubic(0.3, 0.0, 0.8, 0.15),
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
        colorText: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Icons.check),
      );
    }
  }

  void updateProjectContent() {
    project!.title = titleController.text;
    project!.content = contentController.text;
    project!.updatedDate = DateTime.now();
    ProjectListController.to.updateProject(project!);
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
    return ColorUtils.getColorFromScheme(
        index, currentColorSchemeLight, currentColorSchemeDark);
  }

  void getToProjects(Project currentProject) async {
    project = currentProject;
    await updateColorScheme(
        FileImage(File(currentProject.photo.imageFilePath!)));
    titleController.text = currentProject.title ?? "";
    contentController.text = currentProject.content ?? "";
    isLiked.value = currentProject.tags?.contains("favourite") ?? false;

    update(['image']);
    Get.toNamed(Routes.PREVIEW_IMAGE);
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

  void successfulDeleteSnack() {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        'Successfully deleted',
        style: Get.context!.titleMedium,
      ),
      forwardAnimationCurve: const Cubic(0.05, 0.7, 0.1, 1.0),
      reverseAnimationCurve: const Cubic(0.3, 0.0, 0.8, 0.15),
      animationDuration: const Duration(milliseconds: 400),
      backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
      colorText: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(Icons.check),
    );
  }

  @override
  void onInit() {
    super.onInit();
    currentColorSchemeLight = Theme.of(Get.context!).colorScheme;
    colorCombination = ColorCombination(
        background: currentColorSchemeLight.background,
        title: currentColorSchemeLight.onBackground,
        text: currentColorSchemeLight.onBackground.withOpacity(0.8));

    //Initialise Controllers
    titleController = TextEditingController();
    contentController = TextEditingController();
    tabController = TabController(length: 3, vsync: this);
    colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    //Initialise Animations
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

    menuList = [
      MenuIconLabel(
          label: "Info",
          icon: Icons.info,
          onPressed: (BuildContext context) {
            //TODO implement Info
            print("Info");
          }),
      MenuIconLabel(
          label: "Download",
          icon: Icons.download,
          onPressed: (BuildContext context) {
            print("Download");
            downloadImage(getKey());
          }),
      MenuIconLabel(
          label: "Delete",
          icon: Icons.delete,
          onPressed: (BuildContext context) {
            print("Delete");
            showDialog(
                context: Get.context!,
                builder: (_) => AlertDialog(
                      title: Text(
                        "Are you sure want to delete?",
                        style: context.titleMedium,
                      ),
                      actions: [
                        FilledButton(
                          onPressed: () {
                            Get.back();
                            Get.back();
                            successfulDeleteSnack();
                            ProjectListController.to.deleteProject(project!.id);
                          },
                          child: Text(
                            "Yes",
                            style: context.bodyMedium,
                          ),
                        ),
                        FilledButton.tonal(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "No",
                            style: context.bodyMedium,
                          ),
                        )
                      ],
                    ));
          }),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
    tabController.dispose();
    colorController.dispose();
  }
}

class MenuIconLabel {
  String label;
  IconData icon;
  Function(BuildContext) onPressed;

  MenuIconLabel(
      {required this.label, required this.icon, required this.onPressed});
}

class TemplateKeys {
  static final template1 = GlobalKey();
  static final template2 = GlobalKey();
  static final template3 = GlobalKey();
  static final noCropPost = GlobalKey();
}

class CellData {
  double value;
  final int index;
  TextEditingController? controller;

  CellData({required this.value, required this.index});
}

// Map<String, List<double>> predefinedFilters = {
//   'Identity': [
//     //R  G   B    A  Const
//     1, 0, 0, 0, 0, //
//     0, 1, 0, 0, 0, //
//     0, 0, 1, 0, 0, //
//     0, 0, 0, 1, 0, //
//   ],
//   'Grey Scale': [
//     //R  G   B    A  Const
//     0.33, 0.59, 0.11, 0, 0, //
//     0.33, 0.59, 0.11, 0, 0, //
//     0.33, 0.59, 0.11, 0, 0, //
//     0, 0, 0, 1, 0, //
//   ],
//   'Invers': [
//     //R  G   B    A  Const
//     -1, 0, 0, 0, 255, //
//     0, -1, 0, 0, 255, //
//     0, 0, -1, 0, 255, //
//     0, 0, 0, 1, 0, //
//   ],
//   'Sepia': [
//     //R  G   B    A  Const
//     0.393, 0.769, 0.189, 0, 0, //
//     0.349, 0.686, 0.168, 0, 0, //
//     0.272, 0.534, 0.131, 0, 0, //
//     0, 0, 0, 1, 0, //
//   ],
// };
