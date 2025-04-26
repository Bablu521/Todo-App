import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const CustomTextFormField({super.key, required this.controller , required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: AppStyles.style14.copyWith(fontSize: 16),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(122, 37, 78, 86)),
    borderRadius: BorderRadius.circular(8),
  );
}
