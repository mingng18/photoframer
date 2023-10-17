import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photoframer/app/extensions.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);

  PreviewImageController get previewImageController =>
      Get.find<PreviewImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // searchProjects(),
          // const SizedBox(height: 24),
          SizedBox(
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      "lib/app/data/asset/images/barren-tree.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to Photo Framer",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Create your story now!",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Your Projects",
            style: context.titleMedium,
          ),
        ],
      ),
    ));
  }

  Widget searchProjects() {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        hintText: 'Search',
        hintStyle: MaterialStatePropertyAll<TextStyle?>(context.bodyLarge),
        shadowColor: MaterialStatePropertyAll<Color>(
            Theme.of(context).shadowColor.withOpacity(1)),
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.only(left: 16.0, right: 4.0)),
        onTap: () {
          controller.openView();
        },
        onChanged: (_) {
          controller.openView();
        },
        shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
        leading: const Icon(Icons.search),
        trailing: <Widget>[
          Tooltip(
            message: 'Change brightness mode',
            child: IconButton(
              isSelected: Get.isDarkMode,
              onPressed: () {
                Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),
            ),
          )
        ],
      );
    }, suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            // setState(() {
            //   controller.closeView(item);
            // });
          },
        );
      });
    });
  }
}
