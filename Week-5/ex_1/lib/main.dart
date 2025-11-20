import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(children: [
          SelectionButton(), 
          SizedBox(height: 20,),
          SelectionButton()
          ]),
      ),
    ),
  ),
);

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool isSelected = false;
  String get text => isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get buttonColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            isSelected = !isSelected;
          }),
        },
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
