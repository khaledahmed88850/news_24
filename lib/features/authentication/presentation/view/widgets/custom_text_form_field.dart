import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.obscureText = false,
    required this.textInputType,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This Field is required';
        }
        return null;
      },
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
