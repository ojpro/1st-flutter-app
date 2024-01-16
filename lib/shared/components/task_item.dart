import 'package:flutter/material.dart';

Widget TaskItem({
  required bool? completed,
  required String name,
  required Function(bool?) onChange,
  required Function onDeletePressed,
  required Function onEditPressed,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
              value: completed,
              onChanged: (bool? checked) => onChange(checked)),
          Expanded(
            child: GestureDetector(
              onTap: () => onChange(completed == true ? false : true),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: completed == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            enableFeedback: true,
            elevation: 1,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: GestureDetector(
                  onTap: () {
                    onEditPressed();
                    Navigator.pop(context);
                  },
                  child: Text('Edit'),
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: GestureDetector(
                  onTap: () {
                    onDeletePressed();
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
