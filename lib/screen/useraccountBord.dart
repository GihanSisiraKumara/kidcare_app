import 'package:flutter/material.dart';

class UseraccountBord extends StatelessWidget {
  const UseraccountBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: const Center(
        child: Text('Your account here'),
      ),
    );
  }
}
