import 'dart:math';

import 'package:get/get.dart';

class CalendarController extends GetxController {
  RxList<Position> rowColumnPosition = <Position>[].obs;

  int crossAxisCount = 4;
  int imageLength = 4;

  // void inputPosition() {
  //   for (var i = 0; i < imageLength; i++) {
  //     //Decide the first column and row
  //     int firstRow = Random().nextInt(4);
  //     int firstColumn = Random().nextInt(4);

  //     if (crossAxisCount - firstRow > 0) {
  //       int secondRow = Random().nextInt(4 - firstRow);
  //       int secondColumn = Random().nextInt(firstColumn);

  //       if (crossAxisCount - firstRow - secondRow > 0) {
  //         int thirdRow = Random().nextInt(4 - firstRow - secondRow);
  //         int thirdColumn = Random().nextInt(firstColumn);

  //         if (crossAxisCount - firstRow - secondRow - thirdRow > 0) {
  //           int forthRow =
  //               Random().nextInt(4 - firstRow - secondRow - thirdRow);
  //           int forthColumn = Random().nextInt(firstColumn);
  //         } else {
  //           int forthRow =
  //               Random().nextInt(4 - 0);
  //           int forthColumn = Random().nextInt(firstColumn);

  //         }
  //       }
  //     }
  //   }
  // }

  void inputPosition() {
    int col = crossAxisCount;
    int row = Random().nextInt(4) + 1;
    List<List<int>> twoDList = List<List<int>>.generate(
      row,
      (i) => List<int>.generate(col, (index) => 0, growable: false),
      growable: false,
    );
    int imagePutted = 0;
    while (imagePutted < imageLength) {
      int imageWidth = Random().nextInt(col) + 1;
      int imageHeight = Random().nextInt(row) + 1;

      for (int i = 0; i < imageHeight; i++) {
        for (int j = 0; j < imageWidth; j++) {
          twoDList[i][j] = 1;
          imagePutted++;
          rowColumnPosition
              .add(Position(height: imageHeight, width: imageWidth));
        }
      }
    }

    for (int i = 0; i < row; i++) {
      print(twoDList[i]);
    }

    // print(rowColumnPosition);
  }

  void calculatePosition(int previousValue) {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // inputPosition();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class Position {
  int height;
  int width;

  Position({required this.height, required this.width});

  @override
  String toString() {
    return 'Row: $height, Column: $width';
  }
}
