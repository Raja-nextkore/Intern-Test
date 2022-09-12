import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/view/emailVerification_view.dart';
import '/view/login_view.dart';
import '../helper/bottom_button.dart';
import '../helper/constant.dart';
import '../helper/input_field.dart';
import '../helper/main_button.dart';

class SignUpView extends StatefulWidget {
  static const id = '/signUp';

  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUp(String email, String password) async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        Navigator.pushNamedAndRemoveUntil(
            context, EmailVerificationView.id, (route) => false);
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message.toString());
      }
    } else {
      showSnackBar(context, 'Please Enter Valid Data');
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
                signUp(_emailController.text.trim(),
                    _passwordController.text.trim());
              },
              buttonText: 'Sign Up',
            ),
            const SizedBox(
              height: 5.0,
            ),
            BottomButtonHelper(
              onPressed: () {
                Navigator.pushNamed(context, LogInView.id);
              },
              tageLine: 'Already have an account',
              buttonText: 'LogIn',
            )
          ],
        ),
      ),
    );
  }
}
