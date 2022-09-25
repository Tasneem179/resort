import 'dart:ui';

import 'package:flutter/material.dart';
class NewText extends StatelessWidget {
  const NewText({Key? key, required this.string}) : super(key: key);
final String string;
  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: TextStyle(
        color: Colors.cyan,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
