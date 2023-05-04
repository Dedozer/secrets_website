import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key, required this.onPressed});

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: onPressed,
      ),
    );
  }
}
