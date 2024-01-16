import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';
import 'default_input.dart';

class BottomSheetComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, AppStates state) {
        AppCubit appCubit = AppCubit.get(context);
        return Container(
          width: double.maxFinite,
          height: 124,
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
            key: appCubit.bottomSheetFormKey,
            child: Column(
              children: <Widget>[
                DefaultInput(
                  controller: appCubit.nameController,
                  hintText: 'what todo?',
                  suffixIcon: Icons.edit_calendar_rounded,
                  suffixColor: Colors.grey,
                  borderRadius: 8,
                  autoFocus: true,
                  onSuffixClick: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
                    ).then((value) async {
                      appCubit.setTaskDue(value.toString());
                    });
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Task name is important';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AppStates state) => {},
    );
  }
}
