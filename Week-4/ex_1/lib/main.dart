import 'package:flutter/material.dart';

void main() {
runApp(
const MaterialApp( 
  home: Scaffold(
    backgroundColor: Colors.amber,
    body: Center (
      child: (
        Text("Hello! My name is Nita.",
        style: TextStyle(
          color: Colors.pink,
        ),
        )  
      ),
    ),
  ),
),
);
}