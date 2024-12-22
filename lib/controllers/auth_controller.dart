import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_summarization_app/views/home_screen.dart';
import 'package:text_summarization_app/views/login_screen.dart';
import '../services/database_service.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();

  void signup() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      await _dbService.insertUser(username, email, password);
      Get.snackbar('Success', 'Account created successfully');
      Get.to(() => LoginScreen());
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    bool isValid = await _dbService.validateUser(email, password);
    if (isValid) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Get.off(() => HomeScreen());
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/login');
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
