import 'package:get/get.dart';
import 'package:photoframer/app/utils/isar_service.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find();
  late IsarService db;

  final RxBool _isDarkMode = true.obs;
  bool get isDarkMode => _isDarkMode.value;

  void switchThemeModel() {
    _isDarkMode.value = !_isDarkMode.value;
  }

  @override
  void onInit() {
    super.onInit();
    db = IsarService();
  }

  @override
  void onClose() {
    super.onClose();
    db.closeDB();
  }
}
