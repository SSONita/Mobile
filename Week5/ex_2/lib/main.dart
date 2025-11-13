import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple[50],
          foregroundColor: Colors.black,
          title: const Text('Custom bottons'),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: CustomButton(
                  lable: 'Submit',
                  icon: Icons.check,
                  iconPosition: IconPosition.left,
                  buttonType: ButtonType.primary,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: CustomButton(
                  lable: 'Time', 
                  icon: Icons.access_time, 
                  iconPosition: IconPosition.right, 
                  buttonType: ButtonType.secondary
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: CustomButton(
                  lable: 'Account', 
                  icon: Icons.account_tree,
                  iconPosition: IconPosition.right,
                  buttonType: ButtonType.disabled
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String lable;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  const CustomButton({
    super.key,
    required this.lable,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
      ),
      
      onPressed: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left?[
          Icon(icon),
          const SizedBox(width: 8),
          Text(lable)
        ]: [
          Text(lable),
          const SizedBox(width: 8),
          Icon(icon)
        ]
      ),
    );
  }
}

extension ButtonTypeExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }
}
