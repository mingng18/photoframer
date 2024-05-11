import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorUtils {

  static Color Function(String? entities) getColorFromScheme(int index, ColorScheme lightScheme, ColorScheme darkScheme) {
    Color getEntityColor(
        {String? entities, required Color background, required Color text}) {
      switch (entities) {
        case "background":
          return background;
        case "title":
          return text;
        case "text":
          return text.withOpacity(0.8);
        default:
          return background;
      }
    }

    switch (index) {
      case 0:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: Theme.of(Get.context!).colorScheme.background,
            text: Theme.of(Get.context!).colorScheme.onBackground);
      case 1:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: Theme.of(Get.context!).colorScheme.onBackground,
            text: Theme.of(Get.context!).colorScheme.background);
      case 2:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: lightScheme.primary,
            text: lightScheme.onPrimary);
      case 3:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: darkScheme.primary,
            text: darkScheme.onPrimary);
      case 4:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: lightScheme.secondary,
            text: lightScheme.onSecondary);
      case 5:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: darkScheme.secondary,
            text: darkScheme.onSecondary);
      case 6:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: lightScheme.tertiary,
            text: lightScheme.onTertiary);
      case 7:
        return (String? entities) => getEntityColor(
            entities: entities,
            background: darkScheme.tertiary,
            text: darkScheme.onTertiary);
      default:
        return (String? entities) => getEntityColor(
            entities: "background",
            background: Theme.of(Get.context!).colorScheme.background,
            text: Theme.of(Get.context!).colorScheme.onBackground);
    }
  }
  
}