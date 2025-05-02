import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.readOnly,
    this.onTap,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(labelText, style: AppStyles.style14.copyWith(fontSize: 16)),
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
