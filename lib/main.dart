import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/global.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';
import 'package:photoframer/app/modules/projects/controllers/animated_dialog_controller.dart';
import 'package:photoframer/app/modules/projects/controllers/projects_controller.dart';
import 'package:photoframer/app/projects_controller.dart';
import 'package:photoframer/app/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<GlobalService>(GlobalService());
  Get.put<ProjectListController>(ProjectListController());
  Get.lazyPut<PreviewImageController>(
    () => PreviewImageController(),
  );
  Get.lazyPut<ProjectsController>(
    () => ProjectsController(),
  );
  Get.put<AnimatedDialogController>(AnimatedDialogController(),
      permanent: true);

  runApp(
    DynamicColorBuilder(builder: ((lightDynamic, darkDynamic) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Photo Framer",
        initialRoute: AppPages.INITIAL,
        theme: AppTheme().light(lightDynamic),
        darkTheme: AppTheme().dark(darkDynamic),
        themeMode:
            GlobalService.to.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        getPages: AppPages.routes,
      );
    })),
  );
}
