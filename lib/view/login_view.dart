import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/view/home_view.dart';
import '/view/signup_view.dart';
import '../helper/bottom_button.dart';
import '../helper/constant.dart';
import '../helper/input_field.dart';
import '../helper/main_button.dart';

class LogInView extends StatefulWidget {
  static const id = '/logIn';

  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // bool? isVerified;
  // @override
  // initState() {
  //   super.initState();
  //   setState(() {
  //     isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   });
  // }

  Future<void> logIn(String email, String password) async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeView.id, (route) => false);
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputFieldHelper(
              controller: _emailController,
              labelText: 'E-mail',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20.0,
            ),
            InputFieldHelper(
              controller: _passwordController,
              isPasswordField: true,
              labelText: 'Password',
            ),
            const SizedBox(
              height: 20.0,
            ),
            MainButtonHelper(
              onPressed: () {
                logIn(_emailController.text.trim(),
                    _passwordController.text.trim());
              },
              buttonText: 'LogIn',
            ),
            const SizedBox(
              height: 5.0,
            ),
            BottomButtonHelper(
              onPressed: () {
                Navigator.pushNamed(context, SignUpView.id);
              },
              tageLine: 'don\'t have an account',
              buttonText: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
