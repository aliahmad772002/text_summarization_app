import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_summarization_app/controllers/auth_controller.dart';
import 'package:text_summarization_app/views/login_screen.dart';



class SignupScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: authController.usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
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
                onPressed: authController.signup,
                child: const Text('Signup'),
              ),
              TextButton(
                onPressed: () => Get.to(() => LoginScreen()),
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
