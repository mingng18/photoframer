import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';
import 'package:photoframer/app/widgets/image_information.dart';

class PreviewImageView extends GetView<PreviewImageController> {
  PreviewImageView({Key? key}) : super(key: key);

  late double phyToLogRatio;

  @override
  Widget build(BuildContext context) {
    phyToLogRatio = MediaQuery.of(context).devicePixelRatio;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(onPressed: (() {
            controller.getBack();
          })),
          title: TextField(
            controller: controller.titleController,
            style: context.titleMedium,
            onSubmitted: (value) => controller.updateProjectContent(),
            decoration: InputDecoration(
              hintText: "Project Title",
              hintStyle: context.titleMedium!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
              border: InputBorder.none,
            ),
          ),
          actions: [
            MenuAnchor(
              builder: (context, menuController, child) {
                return IconButton(
                  onPressed: () {
                    if (menuController.isOpen) {
                      menuController.close();
                    } else {
                      menuController.open();
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                );
              },
              menuChildren: controller.menuList.asMap().entries.map((entry) {
                final int index = entry.key;
                final MenuIconLabel menuItem = entry.value;

                return AnimatedOpacity(
                  duration: Duration(milliseconds: 200 + index * 200),
                  curve: const Cubic(0.05, 0.7, 0.1, 1.0),
                  opacity: 1,
                  child: MenuItemButton(
                    leadingIcon: Icon(menuItem.icon),
                    onPressed: () {
                      menuItem.onPressed(context);
                    },
                    child: Text(menuItem.label, style: context.bodyMedium),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            canvas(controller.project!, TemplateKeys.template1),
            canvas(controller.project!, TemplateKeys.template2),
            canvas(controller.project!, TemplateKeys.template3),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.shareImage(controller.getKey()),
          child: const Icon(Icons.share),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        bottomNavigationBar: buildBottomAppBar(context),
      );
    });
  }

  Widget canvas(Project project, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GetBuilder<PreviewImageController>(
        id: 'image',
        builder: (_) {
          Widget template = const SizedBox();
          if (controller.project != null) {
            if (key == TemplateKeys.template1) {
              template = template1(project, key);
            } else if (key == TemplateKeys.template2) {
              template = template2(project, key);
            } else if (key == TemplateKeys.template3) {
              template = template3(project, key);
            }
          }
          return template;
        },
      ),
    );
  }

  Widget template1(Project project, GlobalKey key) {
    double aspectRatio = project.photo.aspectRatio ?? 2 / 3;
    // final GlobalKey _firstBackgroundImageKey = GlobalKey();

    return RepaintBoundary(
      key: key,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 1080 / phyToLogRatio,
        height: 1920 / phyToLogRatio,
        padding: EdgeInsets.symmetric(horizontal: 64 / phyToLogRatio),
        decoration: BoxDecoration(
            color: controller.colorCombination.background,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          mainAxisAlignment: aspectRatio > 0.667
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            SizedBox(height: 160 / phyToLogRatio),
            GetBuilder<PreviewImageController>(
              id: 'image',
              builder: (_) => AspectRatio(
                aspectRatio: aspectRatio > 0.0 ? aspectRatio : 1.0,
                child: GestureDetector(
                  onLongPress: () {
                    controller.colorController.forward();
                    // controller.colorController.reverse();
                  },
                  onLongPressEnd: (details) {
                    controller.colorController.reverse();
                    // controller.colorController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: controller.colorAnimation,
                    builder: (context, child) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.matrix([
                          //R  G   B    A  Const
                          controller.colorAnimation.value, 0, 0, 0,
                          controller.alphaAnimation.value, //
                          0, controller.colorAnimation.value, 0, 0,
                          controller.alphaAnimation.value, //
                          0, 0, controller.colorAnimation.value, 0,
                          controller.alphaAnimation.value, //
                          0, 0, 0, 1, 0, //
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: 'picture${project.id}',
                            // child: Flow(
                            //     delegate: ParallaxFlowDelegate(
                            //       scrollable: Scrollable.of(context),
                            //       listItemContext: context,
                            //       backgroundImageKey: _firstBackgroundImageKey,
                            //     ),
                            //     children: [
                            //       Image.file(
                            //         File(project.photo.imageFilePath!),
                            //         fit: BoxFit.cover,
                            //         key: _firstBackgroundImageKey,
                            //       ),
                            //     ]),
                            child: Image.file(
                              File(project.photo.imageFilePath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 32 / phyToLogRatio),
            ImageInformation(
                colorCombination: controller.colorCombination,
                project: project),
          ],
        ),
      ),
    );
  }

  Widget template2(Project project, GlobalKey key) {
    return RepaintBoundary(
      key: key,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 1080 / phyToLogRatio,
        height: 1920 / phyToLogRatio,
        decoration: BoxDecoration(
            color: controller.colorCombination.background,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        alignment: Alignment.center,
        // padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            GetBuilder<PreviewImageController>(
              id: 'image',
              builder: (_) => SizedBox(
                height: double.infinity,
                child: GestureDetector(
                  onLongPress: () {
                    controller.colorController.forward();
                    // controller.colorController.reverse();
                  },
                  onLongPressEnd: (details) {
                    controller.colorController.reverse();
                    // controller.colorController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: controller.colorAnimation,
                    builder: (context, child) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.matrix([
                          //R  G   B    A  Const
                          controller.colorAnimation.value, 0, 0, 0,
                          controller.alphaAnimation.value, //
                          0, controller.colorAnimation.value, 0, 0,
                          controller.alphaAnimation.value, //
                          0, 0, controller.colorAnimation.value, 0,
                          controller.alphaAnimation.value, //
                          0, 0, 0, 1, 0, //
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: 'picture${project.id}',
                            child: Image.file(
                                File(project.photo.imageFilePath!),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
                left: 16,
                bottom: 240 / phyToLogRatio,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${project.photo.imageMake} ${project.photo.imageModel}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 40 / phyToLogRatio,
                        shadows: [
                          Shadow(
                            color: Theme.of(Get.context!)
                                .colorScheme
                                .shadow
                                .withOpacity(0.5),
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4 / phyToLogRatio),
                    project.photo.location?.address == ""
                        ? const SizedBox()
                        : Text(
                            project.photo.location?.address ?? "",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 24 / phyToLogRatio,
                              fontFamily: 'Montserrat',
                              shadows: [
                                Shadow(
                                  color: Theme.of(Get.context!)
                                      .colorScheme
                                      .shadow
                                      .withOpacity(0.5),
                                  blurRadius: 2,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget template3(Project project, GlobalKey key) {
    double aspectRatio = project.photo.aspectRatio ?? 2 / 3;
    return RepaintBoundary(
      key: key,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 1080 / phyToLogRatio,
        height: 1920 / phyToLogRatio,
        padding: EdgeInsets.symmetric(horizontal: 64 / phyToLogRatio),
        decoration: BoxDecoration(
            color: controller.colorCombination.background,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                textAlign: TextAlign.center,
                controller: TextEditingController(
                    text:
                        "${project.photo.imageMake} ${project.photo.imageModel}"),
                style: TextStyle(
                  height: 2,
                  color: controller.colorCombination.title,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 40 / phyToLogRatio,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                )),
            project.photo.location?.address == ""
                ? Text(
                    "${project.photo.focalLength}mm f/${project.photo.exifFNumber} ${project.photo.exifExposureTime}s ISO${project.photo.exifISOSpeedRatings}",
                    style: TextStyle(
                      color: controller.colorCombination.text,
                      fontSize: 20 / phyToLogRatio,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  )
                : Text(
                    project.photo.location?.address ?? "",
                    style: TextStyle(
                      color: controller.colorCombination.text,
                      fontSize: 24 / phyToLogRatio,
                      fontFamily: 'Montserrat',
                    ),
                  ),
            SizedBox(height: 80 / phyToLogRatio),
            GetBuilder<PreviewImageController>(
              id: 'image',
              builder: (_) => AspectRatio(
                aspectRatio: aspectRatio > 0.0 ? aspectRatio : 1.0,
                child: GestureDetector(
                  onLongPress: () {
                    controller.colorController.forward();
                    // controller.colorController.reverse();
                  },
                  onLongPressEnd: (details) {
                    controller.colorController.reverse();
                    // controller.colorController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: controller.colorAnimation,
                    builder: (context, child) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.matrix([
                          //R  G   B    A  Const
                          controller.colorAnimation.value, 0, 0, 0,
                          controller.alphaAnimation.value, //
                          0, controller.colorAnimation.value, 0, 0,
                          controller.alphaAnimation.value, //
                          0, 0, controller.colorAnimation.value, 0,
                          controller.alphaAnimation.value, //
                          0, 0, 0, 1, 0, //
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: 'picture${project.id}',
                            child: Image.file(
                                File(project.photo.imageFilePath!),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      child: BottomAppBar(
        elevation: 2,
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: ((context) =>
                      buildProjectTitleContentInfo(context))),
            ),

            // LikeButton(
            //   padding: EdgeInsets.all(7),
            //     size: 26,
            //     likeBuilder: (bool isLiked) {
            //       return Icon(
            //         Icons.favorite,
            //         color: isLiked
            //             ? Theme.of(context).colorScheme.primary
            //             : Theme.of(context).colorScheme.onSurfaceVariant,
            //         size: 26,
            //       );
            //     },
            //     isLiked: controller.isLiked.value,
            //     onTap: controller.onLikeButtonTapped),
            Obx(() => IconButton(
                  tooltip: 'Favorite',
                  icon: Icon(Icons.favorite,
                      color: controller.isLiked.value
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSurface),
                  onPressed: () => controller.toggleFavourite(),
                )),
            IconButton(
              tooltip: 'Colors',
              icon: const Icon(Icons.color_lens),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: ((context) => buildColorPalette(context))),
            ),
            IconButton(
              tooltip: 'Label Image',
              icon: const Icon(Icons.label),
              onPressed: () {
                Get.snackbar('User 123', 'Successfully created',
                    icon: const Icon(Icons.check),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProjectTitleContentInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          width: 80,
          height: 6,
          decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(16)),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller.titleController,
          style: context.bodyMedium,
          onSubmitted: (value) => controller.updateProjectContent(),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Project Title",
            labelStyle: context.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.5)),
            floatingLabelStyle: context.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.5)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller.contentController,
          style: context.bodyMedium,
          onSubmitted: (value) => controller.updateProjectContent(),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Project Content",
            labelStyle: context.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.5)),
            floatingLabelStyle: context.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.5)),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonal(
                onPressed: () => Get.back(),
                child: Text(
                  "Cancel",
                  style: context.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                  onPressed: () {
                    Get.back();
                    controller.updateProjectContent();
                  },
                  child: Text("Save",
                      style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary))),
            ),
          ],
        )
      ]),
    );
  }

  Widget buildColorPalette(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          width: 80,
          height: 6,
          decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(16)),
        ),
        Table(
          children: List.generate(2, (rowIndex) {
            return TableRow(
              children: List.generate(4, (colIndex) {
                final index = rowIndex * 4 + colIndex;
                return TableCell(
                  child: InkWell(
                    onTap: () {
                      controller.updateBackgroundColor(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index == 0
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).dividerColor.withOpacity(0),
                          width: 2,
                        ),
                        color: controller.getBackgroundColor(index),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                );
              }),
            );
          }),
        )
      ]),
    );
  }
}
