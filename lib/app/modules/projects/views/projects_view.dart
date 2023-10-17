import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/projects/views/animated_dialog.dart';
import 'package:photoframer/app/projects_controller.dart';
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
        body: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Projects",
              style: context.titleMedium,
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
                          projectListController.projects[index], context, index));
            }),
          ],
        ),
      ),
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                        IconButton(
                          onPressed: () {},
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
