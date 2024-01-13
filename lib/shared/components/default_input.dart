// import 'package:flutter/material.dart';
//
// Widget =>

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final Color textColor;
  final String? labelText;
  final String? hintText;
  double borderRadius;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final TextEditingController controller;
  final Function validate;
  Function? onSuffixClick;

  DefaultInput({
    super.key,
    this.textColor = Colors.white,
    this.labelText,
    this.hintText,
    this.borderRadius = 4,
    this.suffixIcon,
    this.suffixColor,
    required this.controller,
    required this.validate,
    this.onSuffixClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => onSuffixClick!(),
          icon: Icon(
            suffixIcon,
            color: suffixColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF2e2e34), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 4),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        hoverColor: Colors.red,
        hintText: hintText,
      ),
      validator: (value) => validate(value),
    );
  }
}
