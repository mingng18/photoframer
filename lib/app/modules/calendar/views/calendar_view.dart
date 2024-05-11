import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/extensions.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('CalendarView'),
        //   centerTitle: true,
        // ),
        body: ListView(
      shrinkWrap: true,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.arrow_left),
            Text("January", style: context.titleLarge),
            Icon(Icons.arrow_right),
          ],
        ),
        const SizedBox(height: 16),
        FilledButton(
            onPressed: () => {
                  controller.inputPosition(),
                  controller.update(['calendar'])
                },
            child: Text("hi")),
        // GetBuilder<CalendarController>(
        //     id: 'calendar',
        //     builder: (context) {
        //       return Expanded(
        //         child: StaggeredGrid.count(
        //             crossAxisCount: controller.crossAxisCount,
        //             mainAxisSpacing: 4,
        //             crossAxisSpacing: 4,
        //             children: controller.rowColumnPosition
        //                 .map(
        //                   (element) => StaggeredGridTile.count(
        //                     crossAxisCellCount: element.width,
        //                     mainAxisCellCount: element.height,
        //                     child: Tile(index: 0),
        //                   ),
        //                 )
        //                 .toList()),
        //       );
        //     }),
      ],
    ));
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? Colors.amber,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
