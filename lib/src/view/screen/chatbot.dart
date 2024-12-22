import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

const Color primaryColor = Color.fromARGB(255, 255, 87, 34); // Orange color

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DriveSphere Support",
          style: TextStyle(
            fontSize: 24, // Make the title larger
            fontWeight: FontWeight.bold, 
            color: Colors.white// Make the title bold
          ),
        ),
        backgroundColor: primaryColor, // Use your custom primary color
      ),
      body: SingleChildScrollView(
        child: HtmlWidget(
          """
          <iframe src="https://www.chatbase.co/chatbot-iframe/vtDt81D45g1_27kUnK9fw" width="100%" height="600"></iframe>
          """,
        ),
      ),
    );
  }
}
