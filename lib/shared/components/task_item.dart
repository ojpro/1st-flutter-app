import 'package:flutter/material.dart';

Widget TaskItem({
  required bool? completed,
  required String name,
  required Function(bool?) onChange,
  Function? onDeletePressed,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Checkbox(
              value: completed,
              onChanged: (bool? checked) => onChange(checked)),
          Expanded(
            child: GestureDetector(
              onTap: () => onChange(completed == true ? false :  true),
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
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () => onDeletePressed!(),
                        child: const Text('Delete'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: Text('Archive'),
                    ),
                  ])
        ],
      ),
    );
