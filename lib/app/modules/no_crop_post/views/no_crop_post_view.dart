import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/data/models/photo_extended.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';

import '../controllers/no_crop_post_controller.dart';

class NoCropPostView extends GetView<NoCropPostController> {
  NoCropPostView({super.key});

  late double phyToLogRatio;

  @override
  Widget build(BuildContext context) {
    phyToLogRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        leading: BackButton(onPressed: (() {
          controller.getBack();
        })),
        title: Text(
          'Post',
          style: context.titleMedium,
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
      body: controller.post != null && controller.post!.photos.isNotEmpty
          ? TabBarView(
              controller: controller.tabController,
              // Use the pre-created content widgets for each tab
              children: List.generate(
                controller.post!.photos.length,
                (int index) {
                  final photo = controller.post!.photos[index];
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: postContent(photo, controller.getKeys(index)),
                  );
                },
              ).toList(), // Convert the generated list to a list
            )
          : const Center(
              child:
                  CircularProgressIndicator(), // Or any other placeholder widget
            ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => controller.shareImage(controller.getKey()),
        onPressed: () {},
        child: const Icon(Icons.share),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }

  Widget postContent(PhotoExtended photoExtended, GlobalKey key) {
    double aspectRatio = photoExtended.photo?.aspectRatio ?? 2 / 3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RepaintBoundary(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: controller.postAspectRatio.value,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: controller.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: aspectRatio > 0.0 ? aspectRatio : 1.0,
                        child: Hero(
                          tag: 'picture${controller.post?.id}',
                          child: Transform.scale(
                            scale: photoExtended.filledPercentage,
                            child: Image.file(
                              File(photoExtended.photo!.imageFilePath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    //Color, tag, like, scale
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      child: BottomAppBar(
        elevation: 2,
        child: Row(
          children: <Widget>[
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
                  onPressed: () => {controller.toggleFavourite()},
                )),
            IconButton(
              tooltip: 'Colors',
              icon: const Icon(Icons.color_lens),
              onPressed: () => showModalBottomSheet(
                  barrierColor: const Color.fromARGB(0, 0, 0, 0),
                  showDragHandle: true,
                  context: context,
                  builder: ((context) => DraggableScrollableSheet(
                      snap: true,
                      snapSizes: const [0.3],
                      expand: false,
                      builder: (context, scrollController) {
                        return buildColorPalette(context);
                      }))),
            ),
            IconButton(
              tooltip: 'Aspect Ratio',
              icon: const Icon(Icons.aspect_ratio),
              onPressed: () => showModalBottomSheet(
                  barrierColor: const Color.fromARGB(0, 0, 0, 0),
                  showDragHandle: true,
                  context: context,
                  builder: ((context) => DraggableScrollableSheet(
                      snap: true,
                      snapSizes: const [0.25],
                      expand: false,
                      builder: (context, scrollController) {
                        return GetBuilder<NoCropPostController>(
                            id: 'post-image',
                            builder: (_) {
                              return Column(
                                children: [
                                  Text(
                                    'Aspect Ratio: ${controller.postAspectRatio.value.toStringAsFixed(2)}', // Convert to string with 2 decimal places
                                    style: context.bodyMedium,
                                  ),
                                  GestureDetector(
                                    onDoubleTap: () => {
                                      controller.postAspectRatio.value = 1,
                                      controller.update(['post-image'])
                                    },
                                    child: Slider(
                                        value: controller.postAspectRatio.value,
                                        min: 3 / 4,
                                        max: 16 / 9,
                                        label: controller.postAspectRatio.value
                                            .toString(),
                                        onChanged: (double value) {
                                          if (value == 1) {
                                            HapticFeedback.lightImpact();
                                          }
                                          controller.postAspectRatio =
                                              value.obs;
                                          controller.update(['post-image']);
                                        }),
                                  ),
                                ],
                              );
                            });
                      }))),
            ),
            IconButton(
              tooltip: 'Scale',
              icon: const Icon(Icons.open_in_full),
              onPressed: () => showModalBottomSheet(
                  barrierColor: const Color.fromARGB(0, 0, 0, 0),
                  showDragHandle: true,
                  context: context,
                  builder: ((context) => DraggableScrollableSheet(
                      snap: true,
                      snapSizes: const [0.25],
                      expand: false,
                      builder: (context, scrollController) {
                        return GetBuilder<NoCropPostController>(
                            id: 'post-image',
                            builder: (_) {
                              final currentPostIndex =
                                  controller.tabController.index;
                              var currentFilled = controller.post
                                  ?.photos[currentPostIndex].filledPercentage;
                              return Column(
                                children: [
                                  Text(
                                    'Scale: ${(currentFilled!).toPrecision(2)}', // Convert to string with 2 decimal places
                                    style: context.bodyMedium,
                                  ),
                                  GestureDetector(
                                    onDoubleTap: () => {
                                      controller.changeFilledPecentage(
                                          currentPostIndex, 1),
                                      controller.update(['post-image'])
                                    },
                                    child: Slider(
                                        value: currentFilled,
                                        min: 0.5,
                                        max: 1,
                                        divisions: 25,
                                        label: currentFilled
                                            .toPrecision(2)
                                            .toString(),
                                        onChanged: (double value) {
                                          if (value * 100 % 2 == 0) {
                                            HapticFeedback.lightImpact();
                                          }
                                          controller.changeFilledPecentage(
                                              currentPostIndex, value);
                                          controller.update(['post-image']);
                                        }),
                                  ),
                                ],
                              );
                            });
                      }))),
            ),
            IconButton(
              tooltip: 'Label Image',
              icon: const Icon(Icons.label),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorPalette(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
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
        ));
  }
}
