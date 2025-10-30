import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),

        child: Column(
          children: [
            CustomCard(text: 'OOP', color: Colors.blue[100]),
            CustomCard(text: 'Dart', color: Colors.blue[300]),
            CustomCard(text: 'Flutter', color: Colors.blue[600]),

            CustomCard(text: 'OOP', gradient: LinearGradient(colors: [Colors.blue.shade100, Colors.blue.shade300])),
            CustomCard(text: 'Dart', gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.blue.shade600])),
            CustomCard(text: 'Flutter', gradient: LinearGradient(colors: [Colors.blue.shade600, Colors.blue.shade900])),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({super.key, required this.text, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: gradient == null? color: null,
        gradient: gradient
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
