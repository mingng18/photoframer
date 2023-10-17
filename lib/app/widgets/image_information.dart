import 'package:flutter/material.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/data/models/project.dart';

class ImageInformation extends StatelessWidget {
  const ImageInformation(
      {super.key, required this.colorCombination, required this.project, this.isPadded = false});

  final ColorCombination colorCombination;
  final Project project;
  final bool isPadded;

  @override
  Widget build(BuildContext context) {
    final phyToLogRatio = MediaQuery.of(context).devicePixelRatio;

    return Container(
      color: colorCombination.background,
      padding: isPadded ? const EdgeInsets.all(10) : const EdgeInsets.all(0),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: IntrinsicColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${project.photo.imageMake} ${project.photo.imageModel}",
                      style: TextStyle(
                        color: colorCombination.title,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 32 / phyToLogRatio,
                      ),
                    ),
                  ],
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  "${project.photo.focalLength}mm\nf/${project.photo.exifFNumber} ${project.photo.exifExposureTime}s ISO${project.photo.exifISOSpeedRatings}",
                  style: TextStyle(
                    color: colorCombination.text,
                    fontSize: 20 / phyToLogRatio,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              TableCell(
                child: project.photo.lensModel != "null"
                    ? Text(
                        project.photo.lensModel ?? "",
                        style: TextStyle(
                          color: colorCombination.title,
                          fontSize: 32 / phyToLogRatio,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Courier New',
                        ),
                      )
                    : project.photo.location?.address == ""
                        ? const SizedBox()
                        : Text(
                            project.photo.location?.address ?? "",
                            style: TextStyle(
                              color: colorCombination.text,
                              fontSize: 24 / phyToLogRatio,
                              fontFamily: 'Montserrat',
                            ),
                          ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.bottom,
                child: Text(
                  project.photo.imageDateTime ?? "",
                  style: TextStyle(
                    color: colorCombination.text,
                    fontSize: 20 / phyToLogRatio,
                    fontFamily: "Courier New",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
