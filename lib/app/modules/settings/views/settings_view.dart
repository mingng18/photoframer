import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/global.dart';
import 'package:photoframer/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: context.titleMedium,
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: context.bodyLarge,
              ),
              value: GlobalService.to.isDarkMode,
              onChanged: (bool? value) {
                controller.toggleDarkMode();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
