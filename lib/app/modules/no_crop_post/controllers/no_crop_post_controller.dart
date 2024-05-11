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
import 'package:photoframer/app/data/models/photo_extended.dart';
import 'package:photoframer/app/data/models/post.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';
import 'package:photoframer/app/utils/constant.dart';
import 'package:photoframer/app/utils/posts_controller.dart';
import 'package:photoframer/app/utils/projects_controller.dart';
import 'package:photoframer/app/routes/app_pages.dart';
import 'package:photoframer/app/utils/color_utils.dart';
import 'package:photoframer/app/utils/image_utils.dart';
import 'package:photoframer/app/utils/coordinates_converter.dart';
import 'package:share_plus/share_plus.dart';

class NoCropPostController extends GetxController
    with GetTickerProviderStateMixin {
  Post? post;

  late ColorScheme currentColorSchemeLight;
  late ColorScheme currentColorSchemeDark;
  late Color backgroundColor;
  RxDouble postAspectRatio = 1.0.obs;

  late TextEditingController titleController;
  late TextEditingController contentController;
  late TabController tabController;
  RxBool isLiked = false.obs;
  var keys = [];

  late List<MenuIconLabel> menuList;

  Future<void> pickImageFromGallery() async {
    final List<XFile>? pickedFileList = await ImageUtils.pickImages();
    List<PhotoExtended> photos = [];
    if (pickedFileList != null) {
      for (var pickedFile in pickedFileList) {
        final File imageFile = File(pickedFile.path);
        final fileBytes = imageFile.readAsBytesSync();
        final data = await readExifFromBytes(fileBytes);
        var decodedImage =
            await decodeImageFromList(imageFile.readAsBytesSync());

        GPSData? gpsData = await CoordinatesConverter.getGPSData(data);

        photos.add(PhotoExtended.fromIfdTag(pickedFile.path, data,
            decodedImage.width, decodedImage.height, gpsData));
      }

      post = Post(
        photos: photos,
        createdDate: DateTime.now(),
        updatedDate: DateTime.now(),
      );
      PostsListController.to.addPost(post!);
      getToPost(post!);
    }
  }

  void getToPost(Post currentPost) async {
    post = currentPost;
    if (currentPost.photos.isNotEmpty) {
      await updateColorScheme(
          FileImage(File(currentPost.photos[0].photo!.imageFilePath!)));
    }
    isLiked.value = currentPost.tags?.contains("favourite") ?? false;

    tabController =
        TabController(length: currentPost.photos.length, vsync: this);
    generateKeys();

    update(['post-image']);
    Get.toNamed(Routes.NO_CROP_POST);
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

  bool toggleFavourite() {
    if (!isLiked.value) {
      post!.tags?.add("favourite");
    } else {
      post!.tags?.remove("favourite");
    }
    isLiked.value = !isLiked.value;
    PostsListController.to.updatePost(post!);
    // update(['like']);
    return isLiked.value;
  }

  void getBack() {
    backgroundColor = getBackgroundColor(0);
    Get.back();
  }

  Color getBackgroundColor(int index) {
    return getColor(index)(null);
  }

  Color Function(String? entities) getColor(int index) {
    return ColorUtils.getColorFromScheme(
        index, currentColorSchemeLight, currentColorSchemeDark);
  }

  void updateBackgroundColor(int index) {
    backgroundColor = getColor(index)("background");
    update(['post-image']);
  }

  void generateKeys() {
    for (var i = 0; i < post!.photos.length; i++) {
      final key = GlobalKey();
      keys.add(key);
    }
  }

  void changeFilledPecentage(int index, double value) {
    post?.photos[index].filledPercentage = value;
    PostsListController.to.updatePost(post!);
  }

  GlobalKey getKeys(index) {
    return keys[index];
  }

  void downloadImage(
    GlobalKey key,
  ) async {
    if (await ImageUtils.downloadImage(key)) {
      print("Successful");
      successfulSnack();
    } else {
      print("Failed");
      failSnack();
    }
  }

  Future<void> downloadAllImage() async {
    List<bool> results = [];
    for (var i = 0; i < post!.photos.length; i++) {
      // print(getKeys(i).toString());
      tabController.animateTo(i, duration: const Duration(milliseconds: 10));
      bool result = await ImageUtils.downloadImage(getKeys(i));
      results.add(result);
    }
    bool allDownloadsSuccessful = results.every((result) => result == true);
    if (allDownloadsSuccessful) {
      // All downloads were successful
      print('All downloads were successful!');
      Get.back();
      successfulSnack();
    } else {
      // At least one download failed
      print('Some downloads failed.');
      failSnack();
    }
  }

  void successfulSnack() {
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

  void failSnack() {
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

  @override
  void onInit() {
    super.onInit();
    currentColorSchemeLight = Theme.of(Get.context!).colorScheme;
    backgroundColor = Colors.white;

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
            downloadImage(getKeys(tabController.index));
          }),
      // MenuIconLabel(
      //     label: "Download All",
      //     icon: Icons.file_download,
      //     onPressed: (BuildContext context) {
      //       downloadAllImage();
      //     }),
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
                            PostsListController.to.deletePost(post!.id);
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose(); // Dispose the TabController
    super.onClose();
  }
}
