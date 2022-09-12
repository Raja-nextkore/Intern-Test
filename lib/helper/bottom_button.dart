import 'package:flutter/material.dart';

class BottomButtonHelper extends StatelessWidget {
  final VoidCallback onPressed;
  final String tageLine;
  final String buttonText;

  const BottomButtonHelper({
    Key? key,
    required this.onPressed,
    required this.tageLine,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tageLine),
        const SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
