import 'package:flutter/material.dart';

class AdminBord extends StatelessWidget {
  const AdminBord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent!"),
      ),
      body: const Center(
        child: Text('Welcome Parents!'),
      ),
    );
  }
}
