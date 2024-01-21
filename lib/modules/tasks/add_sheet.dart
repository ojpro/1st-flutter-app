import 'package:first_app/shared/components/default_input.dart';
import 'package:flutter/material.dart';

class AddTaskSheet extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      width: double.maxFinite,
      height: 90,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1f1f28),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
