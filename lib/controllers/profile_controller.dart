import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString profileImagePath = ''.obs;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImage', pickedFile.path);
    }
  }

  Future<void> loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profileImagePath.value = prefs.getString('profileImage') ?? '';
  }
}
