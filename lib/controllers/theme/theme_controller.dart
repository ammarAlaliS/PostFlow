import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  void setDarkMode() async {
    isDarkMode.value = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', true);
  }

  void setLightMode() async {
    isDarkMode.value = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', false);
  }
}
