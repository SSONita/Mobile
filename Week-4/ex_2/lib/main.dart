import 'package:flutter/material.dart';

void main() {
runApp(MaterialApp(
home: Container( 
  color: Colors.blue[200],
  padding: EdgeInsets.all(50.00),
  margin: EdgeInsets.all(40.00),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.blue[600],
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(
      child: Text("CADT Student",
        style: TextStyle(
          color: Colors.white
        ),
      )
    ),
  ),
),
));
}