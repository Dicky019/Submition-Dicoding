import 'package:flutter/material.dart';

class IconTimeWidget extends StatelessWidget {
  const IconTimeWidget({
    Key? key,
    required this.date,
    required this.icon,
  }) : super(key: key);

  final String date;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          date,
        ),
      ],
    );
  }
}