import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Text Summarizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Enter text to summarize'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                homeController.summarizeText(textController.text);
              },
              child: Text('Summarize'),
            ),
            Obx(() => Text(
              homeController.summary.value,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}
