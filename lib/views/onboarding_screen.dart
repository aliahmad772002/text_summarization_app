import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                buildOnboardingPage('images/screen1.png', 'Welcome', 'Your AI Assistant'),
                buildOnboardingPage('images/screen2.png', 'Summarize', 'Summarize text easily'),
                buildOnboardingPage('images/screen3.png', 'Save Time', 'Make your life easier'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Get.off(LoginScreen()),
              child: Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(String image, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
