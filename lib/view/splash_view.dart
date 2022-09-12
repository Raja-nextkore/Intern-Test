import 'dart:async';

import 'package:flutter/material.dart';

import '/view/signup_view.dart';

class SplashView extends StatefulWidget {
  static const id = '/';

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, SignUpView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          'Day Planner',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
