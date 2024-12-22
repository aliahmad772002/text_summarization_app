import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_summarization_app/views/home_screen.dart';
import 'package:text_summarization_app/views/login_screen.dart';
import 'package:text_summarization_app/views/onboarding_screen.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 4), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        Get.off(() => HomeScreen());
      } else {
        Get.off(() => OnboardingScreen());
      }
    });

    return  Scaffold(
        body: Center(

          child: Image.asset('images/Logo.png', fit: BoxFit.fill, width: width*0.4,),
        )
    );
  }
}
