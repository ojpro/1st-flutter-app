import 'package:flutter/material.dart';

class GenericInput extends StatelessWidget {
  final Color textColor;
  final String? labelText;
  final String? hintText;
  double borderRadius;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final TextEditingController controller;
  final Function validate;
  Function? onSuffixClick;
  Function onSubmitPressed;
  final bool autoFocus;

  // Additional customization options
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double borderWidth;

  GenericInput({
    Key? key,
    this.textColor = Colors.white,
    this.labelText,
    this.hintText,
    this.borderRadius = 4,
    this.suffixIcon,
    this.suffixColor,
    required this.onSubmitPressed,
    required this.controller,
    required this.validate,
    this.onSuffixClick,
    this.autoFocus = false,
    this.enabledBorderColor = const Color(0xFF2e2e34),
    this.focusedBorderColor = Colors.grey,
    this.borderWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: UniqueKey(),
      onFieldSubmitted: (value) => onSubmitPressed(value),
      autofocus: autoFocus,
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
          borderSide: BorderSide(color: enabledBorderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        hoverColor: Colors.red,
        hintText: hintText,
      ),
      validator: (value) => validate(value),
    );
  }
}
