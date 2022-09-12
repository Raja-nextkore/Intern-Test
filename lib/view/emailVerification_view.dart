import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/helper/main_button.dart';
import '/view/addDetails_view.dart';
import '/view/signup_view.dart';
import '../helper/constant.dart';

class EmailVerificationView extends StatefulWidget {
  static const id = '/emailVerification';

  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  bool isVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      sendVerification();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) timer?.cancel();
  }

  Future<void> sendVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail == false;
      });
      Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail == true;
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? const AddDetailsView()
      : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Email Verification'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'E-mail Verification link sent to your e-mail Please Verify'),
                const SizedBox(
                  height: 10.0,
                ),
                MainButtonHelper(
                    onPressed: () async {
                      if (canResendEmail == true) {
                        showSnackBar(context, 'Verification link sent again');
                        return sendVerification();
                      } else {
                        return;
                      }
                    },
                    buttonText: 'Re-send'),
                const SizedBox(
                  height: 10.0,
                ),
                MainButtonHelper(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignUpView.id, (route) => false);
                    },
                    buttonText: 'Cancel'),
              ],
            ),
          ),
        );
}
