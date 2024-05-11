import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/create/bindings/create_binding.dart';
import '../modules/create/views/create_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/no_crop_post/bindings/no_crop_post_binding.dart';
import '../modules/no_crop_post/views/no_crop_post_view.dart';
import '../modules/preview_image/bindings/preview_image_binding.dart';
import '../modules/preview_image/views/preview_image_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW_IMAGE,
      page: () => PreviewImageView(),
      binding: PreviewImageBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTS,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => const CreateView(),
      binding: CreateBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.NO_CROP_POST,
      page: () => NoCropPostView(),
      binding: NoCropPostBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
  ];
}
