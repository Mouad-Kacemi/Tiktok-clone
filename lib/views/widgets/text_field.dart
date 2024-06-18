import 'package:flutter/material.dart';
import 'package:islam_tiktok/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key, required this.controller, required this.labelText,  this.isObsecure=false, required this.icon});
  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: borderColor)),
      ),
      obscureText: isObsecure,
    );
  }
}
