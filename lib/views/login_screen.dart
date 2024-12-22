import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_summarization_app/controllers/auth_controller.dart';
import 'package:text_summarization_app/views/signup_screen.dart';




class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: authController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: authController.passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: authController.login,
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: const Text('Don’t have an account? Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
