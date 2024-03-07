import 'package:flutter/material.dart';

class notificationBord extends StatelessWidget {
  const notificationBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification!"),
      ),
      body: const Center(
        child: Text('View Nortification!'),
      ),
    );
  }
}
