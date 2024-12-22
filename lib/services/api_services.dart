import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String apiUrl = 'https://api.openai.com/v1/chat/completions';
  static const String apiKey = 'use your api key here';

  static Future<String> summarizeText(String text) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'system', 'content': 'You are a helpful assistant for summarizing text.'},
            {'role': 'user', 'content': 'Summarize this: $text'}
          ],
          'max_tokens': 150,
          'temperature': 0.7,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');


      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        throw Exception('Failed to get a summary: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error while summarizing text: $e');
    }
  }
}
