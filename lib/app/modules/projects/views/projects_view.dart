import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/data/models/post.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/projects/views/animated_dialog.dart';
import 'package:photoframer/app/utils/posts_controller.dart';
import 'package:photoframer/app/utils/projects_controller.dart';
import 'package:photoframer/app/widgets/image_information.dart';

import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('ProjectsView'),
        //   centerTitle: true,
        // ),
        body: TabBarView(
      controller: controller.tabController,
      children: [
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_forward,
                        color: Color.fromARGB(0, 0, 0, 0)),
                    Center(
                      child: Text(
                        "Story",
                        style: context.titleLarge,
                      ),
                    ),
                    AnimatedBuilder(
                        animation: controller.animationController,
                        builder: (context, child) {
                          return Transform.translate(
                              offset: Offset(
                                  controller.rightAnimation.value.toDouble(),
                                  0),
                              child: InkWell(
                                  onTap: () =>
                                      controller.tabController.animateTo(1),
                                  child: const Icon(Icons.arrow_forward)));
                        })
                  ],
                ),
                const SizedBox(height: 8),
                // Obx(
                GetX<ProjectListController>(
                    // id: 'projects',
                    builder: (projectListController) {
                  return projectListController.projects.isEmpty
                      ? const Text("You have no projects yet...")
                      : MasonryGridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: projectListController.projects.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => projectCard(
                              projectListController.projects[index],
                              context,
                              index));
                }),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                        animation: controller.animationController,
                        builder: (context, child) {
                          return Transform.translate(
                              offset: Offset(
                                  controller.leftAnimation.value.toDouble(),
                                  0),
                              child: InkWell(
                                  onTap: () =>
                                      controller.tabController.animateTo(0),
                                  child: const Icon(Icons.arrow_back)));
                        }),
                    Center(
                      child: Text(
                        "Post",
                        style: context.titleLarge,
                      ),
                    ),
                    const Icon(Icons.arrow_forward,
                        color: Color.fromARGB(0, 0, 0, 0)),
                  ],
                ),
                const SizedBox(height: 8),
                GetX<PostsListController>(
                    // id: 'projects',
                    builder: (postsListController) {
                  return postsListController.posts.isEmpty
                      ? const Text("You have no posts yet...")
                      : MasonryGridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: postsListController.posts.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => postCard(
                              postsListController.posts[index],
                              context,
                              index));
                }),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget projectCard(Project project, BuildContext context, int index) {
    OverlayEntry? popupImage;

    return AnimatedOpacity(
      duration: Duration(milliseconds: 500 + index * 200),
      curve: const Cubic(0.05, 0.7, 0.1, 1.0),
      opacity: controller.onFirstStart.value ? 1 : 1,
      onEnd: () => controller.onFirstStart.value = false,
      child: GestureDetector(
        onLongPress: () {
          popupImage = _createPopupImageEntry(
              project, context, controller.getRandomColor());
          controller.animatedDialogController.animationController.forward();
          Overlay.of(context).insert(popupImage!);
        },
        onLongPressEnd: (details) {
          controller.animatedDialogController.animationController
              .reverse()
              .then((value) => popupImage?.remove());
        },
        child: InkWell(
          onTap: () {
            controller.previewImageController.getToProjects(project);
          },
          child: Card(
            color: controller.getRandomColor().background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: project.photo.aspectRatio!,
                  child: Hero(
                    tag: 'picture${project.id}',
                    child: Image.file(File(project.photo.imageFilePath!),
                        fit: BoxFit.cover),
                  ),
                ),
                project.title == null
                    ? const SizedBox(height: 8)
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          project.title ?? "My First Project",
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: controller.getRandomColor().text,
                          ),
                        ),
                      ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.formatDateTime(project.createdDate),
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 10,
                      fontWeight: project.title == null
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: controller.getRandomColor().text,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget postCard(Post post, BuildContext context, int index) {
    OverlayEntry? popupImage;

    return AnimatedOpacity(
      duration: Duration(milliseconds: 500 + index * 200),
      curve: const Cubic(0.05, 0.7, 0.1, 1.0),
      opacity: controller.onFirstStart.value ? 1 : 1,
      onEnd: () => controller.onFirstStart.value = false,
      child: GestureDetector(
        // onLongPress: () {
        //   popupImage = _createPopupImageEntry(
        //       project, context, controller.getRandomColor());
        //   controller.animatedDialogController.animationController.forward();
        //   Overlay.of(context).insert(popupImage!);
        // },
        // onLongPressEnd: (details) {
        //   controller.animatedDialogController.animationController
        //       .reverse()
        //       .then((value) => popupImage?.remove());
        // },
        child: InkWell(
          onTap: () {
            controller.noCropPostController.getToPost(post);
          },
          child: Card(
            color: controller.getRandomColor().background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: post.photos[0].photo!.aspectRatio!,
                  child: Hero(
                    tag: 'picture${post.id}',
                    child: Image.file(
                        File(post.photos[0].photo!.imageFilePath!),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    controller.formatDateTime(post.createdDate),
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: controller.getRandomColor().text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _createPopupImageEntry(Project project, BuildContext context,
      ColorCombination colorCombination) {
    return OverlayEntry(
        builder: (context) => AnimatedDialog(
                child: Container(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  AspectRatio(
                    aspectRatio: project.photo.aspectRatio!,
                    child: Image.file(File(project.photo.imageFilePath!),
                        fit: BoxFit.cover),
                  ),
                  ImageInformation(
                      colorCombination: ColorCombination(
                          background: Theme.of(context).colorScheme.surface,
                          title: Theme.of(context).colorScheme.onSurface,
                          text: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8)),
                      project: project,
                      isPadded: true),
                  Container(
                    color: colorCombination.background,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTapUp: (details) {
                            print("yayyy");
                            // controller.previewImageController.toggleFavourite();
                          },
                          onTapDown: (details) => print("down"),
                          onLongPressUp: () => print("long press up"),
                          onLongPressDown: (details) =>
                              print("long press down"),
                          onLongPressEnd: (details) => print("long press end"),
                          onLongPress: () => print("long press"),
                          child: IconButton(
                            onPressed: () {},
                            tooltip: "Favourite",
                            icon: const Icon(Icons.favorite),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          tooltip: "delete",
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}
