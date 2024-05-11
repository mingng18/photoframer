import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

class ImageUtils {
  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery, maxWidth: 1080);
      if (pickedFile == null) {
        print("No Image Selected");
        return null;
      }
      return pickedFile;
    } catch (error) {
      print("Error picking image: $error");
    }
    return null;
  }

  static Future<List<XFile>?> pickImages() async {
    final ImagePicker picker = ImagePicker();

    try {
      final List<XFile> pickedFile =
          await picker.pickMultiImage(maxWidth: 1080);
      print("Picked");

      return pickedFile;
    } catch (error) {
      print("Error picking image: $error");
    }
    return null;
  }

  static Future<bool> downloadImage(GlobalKey key) async {
    try {
      print('here1');
      print(key.toString());
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      print('here2');
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      print('here21');
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      print('here22');

      var status = await Permission.storage.status;
      if (status.isDenied) {
        await Permission.storage.request();
      }
      print('here3');

      if (byteData != null) {
        final result =
            await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print('here4');

        print("result: $result");
        return result != null &&
            result.isNotEmpty; // Return true if saved successfully
      } else {
        return false; // Return false if byteData is null
      }
    } catch (e) {
      print("Error while saving image: $e");
      return false; // Return false in case of any exceptions
    }
  }

  static void shareImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await (image.toByteData(format: ui.ImageByteFormat.png));
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final formattedDateTime =
          DateFormat('yyyyMMddHHmmss').format(DateTime.now());

      final generatedImage =
          await File('${appDocumentsDir.path}/$formattedDateTime.png')
              .writeAsBytes(pngBytes);

      // Share Plugin
      final XFile imageFile =
          XFile('${appDocumentsDir.path}/$formattedDateTime.png');
      await Share.shareXFiles([imageFile]);
    } catch (e) {
      print("Error: $e");
    }
  }
}
