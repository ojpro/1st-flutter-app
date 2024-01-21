import 'package:flutter/material.dart';

Widget TaskItem({
  required bool? completed,
  required String name,
  required Function(bool?) onChange,
  required Function onDeletePressed,
  required Function onEditPressed,
  required Function onArchivePressed,
}) =>
    Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsetsDirectional.only(start: 12),
        color: Colors.red,
        child: const Row(
          children: [
            Text('Delete', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsetsDirectional.only(end: 12),
        color: Colors.brown,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Archive', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      onDismissed: (direction) {
        if(direction == DismissDirection.startToEnd){
          onDeletePressed();
        }else{
          onArchivePressed();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
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
                  value: 'edit',
                  child: GestureDetector(
                    onTap: () {
                      onEditPressed();
                      Navigator.pop(context);
                    },
                    child: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onDeletePressed();
                    },
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
