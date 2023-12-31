import 'package:flutter/material.dart';

import '../../constants/app_sizes.dart';

/// Text button to be used as an [AppBar] action
class ActionOutlinedButton extends StatelessWidget {
  const ActionOutlinedButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
