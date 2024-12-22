import 'package:get/get.dart';
import '../services/api_services.dart';

class HomeController extends GetxController {
  RxString summary = ''.obs;

  Future<void> summarizeText(String text) async {
    try {
      summary.value = await AIService.summarizeText(text);
    } catch (e) {
      Get.snackbar('Error', 'Failed to summarize text');
    }
  }
}
