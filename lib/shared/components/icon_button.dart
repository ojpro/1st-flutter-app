import 'package:flutter/material.dart';

Widget defaultIconButton() => IconButton(
      onPressed: () => {},
      icon: const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
