import 'package:flutter/material.dart';

class InputFieldHelper extends StatelessWidget {
  final TextInputType? inputType;
  final String labelText;
  final bool? isPasswordField;
  final TextEditingController controller;

  const InputFieldHelper({
    Key? key,
    this.inputType,
    required this.labelText,
    this.isPasswordField,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordField ?? false,
      keyboardType: inputType,
      validator: (value) {
        if (value == null) {
          return 'Please Enter Valid Data';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
