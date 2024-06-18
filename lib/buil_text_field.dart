
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const BuildTextField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            const TextStyle(color: Color.fromRGBO(85, 107, 47, 1), fontSize: 20.0),
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(color: Color.fromRGBO(85, 107, 47, 1)),
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
}