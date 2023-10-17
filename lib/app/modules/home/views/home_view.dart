import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/home/controllers/home_controller.dart';
import 'package:photoframer/app/modules/landing/views/landing_view.dart';
import 'package:photoframer/app/modules/projects/controllers/projects_controller.dart';
import 'package:photoframer/app/modules/projects/views/projects_view.dart';
import 'package:photoframer/app/modules/settings/views/settings_view.dart';
import 'package:photoframer/app/widgets/bottom_nav_bar.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final ProjectsController projectsController = Get.find<ProjectsController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Padding(
        //     padding: const EdgeInsets.only(top: 12.0),
        //     child: Image.asset(
        //       Get.isDarkMode
        //           ? "lib/app/data/asset/images/photoFrameLogo.png"
        //           : "lib/app/data/asset/images/photoFrameLogoLight.png",
        //       height: 32,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () => Get.changeThemeMode(
        //           Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
        //       icon: const Icon(Icons.light_mode),
        //     ),
        //   ],
        // ),
        floatingActionButton: expandableFab(context),
        bottomNavigationBar: Obx(() {
          return BottomNavBar(
            selectedIndex: controller.tabIndex.value,
            onDestinationSelected: (int index) {
              controller.changeTabIndex(index);
              controller.isFABOpened.value = false;
              // print("current index is "+ index.toString());
              if (index == 1) {
                projectsController.onScreenStarted();
              }
            },
          );
        }),
        body: SafeArea(
          child: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: const [
                  LandingView(),
                  // CreateView(),
                  ProjectsView(),
                  SettingsView(),
                ],
              )),
        ),
      );
    });
  }

  OverlayEntry? blackFilter = OverlayEntry(
      builder: (context) => Material(
            color: Colors.black.withOpacity(0.5),
          ));

  Widget expandableFab(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildExpandingList(context),
          _buildTapToCloseFab(context),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab(BuildContext context) {
    return Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transformAlignment: Alignment.bottomRight,
        width: controller.isFABOpened.value ? 160 : 56,
        height: controller.isFABOpened.value ? 56 : 56,
        curve: const Cubic(0.05, 0.7, 0.1, 1.0),
        // padding: controller.isOpened.value
        //     ? const EdgeInsets.all(16)
        //     : const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: controller.isFABOpened.value
            ? listButton(context, 0)
            : FloatingActionButton(
                mouseCursor: SystemMouseCursors.click,
                onPressed: () => controller.toggleFAB(),
                child: const Icon(Icons.add),
              )));
  }

  Widget _buildExpandingList(BuildContext context) {
    return Obx(() => AnimatedOpacity(
          opacity: controller.isFABOpened.value ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: controller.isFABOpened.value ? 160 : 56,
            height: controller.isFABOpened.value
                ? 56 + (controller.actionButtons.length - 1) * 56
                : 0,
            curve: const Cubic(0.05, 0.7, 0.1, 1.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                  blurRadius: controller.isFABOpened.value ? 8 : 0,
                  // offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.actionButtons.length - 1,
                itemBuilder: (context, index) {
                  return listButton(context, index + 1);
                }),
          ),
        ));
  }

  Widget listButton(BuildContext context, int index) {
    return AnimatedOpacity(
      opacity: controller.isFABOpened.value ? 1 : 0,
      duration: Duration(
          milliseconds: (controller.actionButtons.length - index) * 300),
      curve: Curves.easeInOutCubicEmphasized,
      child: InkWell(
        onTap: () {
          controller.actionButtons[index].onPressed();
        },
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              index == 0
                  ? rotatableCreateIcon()
                  : scalableIcon(index, controller.actionButtons[index].icon),
              const SizedBox(width: 16),
              Text(
                controller.actionButtons[index].title,
                style: context.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rotatableCreateIcon() {
    return Obx(() => AnimatedRotation(
        turns: controller.isFABOpened.value ? 0.125 : 0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubicEmphasized,
        child: const Icon(Icons.add)));
  }

  Widget scalableIcon(int index, IconData icon) {
    return Obx(() => AnimatedContainer(
          alignment: Alignment.topLeft,
          width: 24,
          height: 24,
          transform: (controller.isFABOpened.value
              ? (Matrix4.identity()..scale(2.0, 2.0))
              : Matrix4.identity()),
          duration: Duration(
              milliseconds:
                  (controller.actionButtons.length - index) * 300 + 200),
          curve: Curves.easeInOutCubicEmphasized,
          child: Icon(icon, size: 12),
        ));
  }

  // Widget _buildTapToOpenFab(){
  //   return AnimatedContainer(duration: duration)
  // }

  // Widget createButton(BuildContext context) {
  //   return FloatingActionButton(
  //     onPressed: () => bottomModal(context),
  //     child: const Icon(Icons.add),
  //   );
  // }

  // Future bottomModal(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) => Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   margin: const EdgeInsets.symmetric(vertical: 16),
  //                   width: 80,
  //                   height: 6,
  //                   decoration: BoxDecoration(
  //                       color: Theme.of(context).dividerColor,
  //                       borderRadius: BorderRadius.circular(16)),
  //                 ),
  //                 Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Expanded(
  //                         child: AspectRatio(
  //                           aspectRatio: 1,
  //                           child: ElevatedButton(
  //                             style: ElevatedButton.styleFrom(
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(16.0),
  //                               ),
  //                               backgroundColor:
  //                                   Theme.of(context).colorScheme.onTertiary,
  //                             ),
  //                             onPressed: () {
  //                               Get.back();
  //                               previewImageController.pickImageFromGallery();
  //                             },
  //                             child: Text(
  //                               "Story",
  //                               style: context.labelSmall,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(width: 16),
  //                       Expanded(
  //                         child: AspectRatio(
  //                           aspectRatio: 1,
  //                           child: ElevatedButton(
  //                             style: ElevatedButton.styleFrom(
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(16.0),
  //                               ),
  //                               backgroundColor:
  //                                   Theme.of(context).colorScheme.onSecondary,
  //                             ),
  //                             onPressed: () =>
  //                                 previewImageController.pickImageFromGallery(),
  //                             child: Text(
  //                               "Post",
  //                               style: context.labelSmall,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ]),
  //               ],
  //             ),
  //           ));
  // }
}
