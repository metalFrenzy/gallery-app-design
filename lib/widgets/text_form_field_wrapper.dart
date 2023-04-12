import 'package:flutter/material.dart';

class TextFormFieldWrapper extends StatelessWidget {
  final child;

  const TextFormFieldWrapper({required this.child});

  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(10),
      padding:  const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
