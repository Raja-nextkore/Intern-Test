import 'package:flutter/material.dart';

class MainButtonHelper extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const MainButtonHelper({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
