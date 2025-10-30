import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradiantButton(text: 'Hello1', start: Colors.blue, end: Colors.red),
              GradiantButton(text: 'Hello2', start: Colors.blue, end: Colors.red),
              GradiantButton(text: 'Hello3', start: Colors.blue, end: Colors.red),
            ],
          ),
        ),
      ),
    ),
  );
}

class GradiantButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  const GradiantButton({
    super.key, 
    required this.text, 
    required this.start, 
    required this.end
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            start,
            end
          ],
        ),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 35)),
      ),
    );
  }
}
