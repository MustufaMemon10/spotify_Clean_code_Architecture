import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title, required this.controller});

final String title;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {

    return TextField(
        autocorrect: true,
        textInputAction: TextInputAction.next,
        cursorWidth: 1,
        controller: controller,
        cursorColor: context.isDarkMode
            ? Colors.white.withOpacity(0.6)
            : Colors.black.withOpacity(0.6),
        decoration: InputDecoration(
          hintText: title,
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }
  }