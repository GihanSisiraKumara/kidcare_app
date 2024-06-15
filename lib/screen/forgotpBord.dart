import 'package:flutter/material.dart';

class ForgotpBord extends StatefulWidget {
  const ForgotpBord({super.key, required String title});

  @override
  State<ForgotpBord> createState() => _ForgotpBordState();
}

class _ForgotpBordState extends State<ForgotpBord> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }

  // ...
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
