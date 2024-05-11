// import 'package:flutter/material.dart';

// class ParallaxFlowDelegate extends FlowDelegate {
//   ParallaxFlowDelegate({
//     required this.scrollable,
//     required this.listItemContext,
//     required this.backgroundImageKey,
//   }) : super(repaint: scrollable.position);

//   final ScrollableState scrollable;
//   final BuildContext listItemContext;
//   final GlobalKey backgroundImageKey;

//   @override
//   BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
//     return BoxConstraints.tightFor(
//       width: constraints.maxWidth,
//     );
//   }

//   @override
//   void paintChildren(FlowPaintingContext context) {
//     // Calculate the position of this list item within the viewport.
//     final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
//     final listItemBox = listItemContext.findRenderObject() as RenderBox;
//     final listItemOffset = listItemBox.localToGlobal(
//         listItemBox.size.centerLeft(Offset.zero),
//         ancestor: scrollableBox);

//     // Determine the percent position of this list item within the
//     // scrollable area.
//     final viewportDimension = scrollable.position.viewportDimension;
//     final scrollFraction =
//         (listItemOffset.dy / viewportDimension).clamp(1.0, 0.0);

//     // Calculate the vertical alignment of the background
//     // based on the scroll percent.
//     final verticalAlignment = Alignment(scrollFraction * 2 - 1, 0.0);

//     // Convert the background alignment into a pixel offset for
//     // painting purposes.
//     final backgroundSize =
//         (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
//             .size;
//     final listItemSize = context.size;
//     final childRect =
//         verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

//     // Paint the background.
//     context.paintChild(
//       0,
//       transform:
//           Transform.translate(offset: Offset(childRect.top, 0.0)).transform,
//     );
//   }

//   @override
//   bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
//     return scrollable != oldDelegate.scrollable ||
//         listItemContext != oldDelegate.listItemContext ||
//         backgroundImageKey != oldDelegate.backgroundImageKey;
//   }
// }
