import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  // Esta variable será observada por Obx
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();  // Cargar el tema desde SharedPreferences al iniciar
  }

  // Método para cargar el tema guardado en SharedPreferences
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false; // Si no se encuentra el valor, se asigna false
  }

  // Método para activar el tema oscuro y guardar la preferencia
  void setDarkMode() async {
    isDarkMode.value = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', true);
  }

  // Método para activar el tema claro y guardar la preferencia
  void setLightMode() async {
    isDarkMode.value = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', false);
  }
}
