import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Size size;
  final String title;
  final VoidCallback onPressed;
  final bool isBorder;
  const ButtonWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.onPressed,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        primary: isBorder ? Colors.transparent : Colors.black,
        elevation: 0,
        minimumSize: Size(
          size.width,
          50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: isBorder ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}