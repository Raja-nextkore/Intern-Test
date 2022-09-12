import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '/view/addPlan_view.dart';
import '/view/emailVerification_view.dart';
import 'firebase_options.dart';
import 'view/home_view.dart';
import 'view/login_view.dart';
import 'view/signup_view.dart';
import 'view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Planner',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => const SplashView(),
        SignUpView.id: (context) => const SignUpView(),
        LogInView.id: (context) => const LogInView(),
        HomeView.id: (context) => const HomeView(),
        EmailVerificationView.id: (context) => const EmailVerificationView(),
        AddPlanView.id: (context) => const AddPlanView(),
      },
    );
  }
}
