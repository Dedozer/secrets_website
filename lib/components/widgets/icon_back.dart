import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key, required this.onPressed});

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
