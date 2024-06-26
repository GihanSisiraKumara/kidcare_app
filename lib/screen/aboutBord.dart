import 'package:flutter/material.dart';
import 'package:kidcare/screen/dayBord.dart';
import 'package:lottie/lottie.dart';

class aboutBord extends StatelessWidget {
  const aboutBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 215, 213),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              child: Lottie.asset('assets/animations/Animation - 0.json'),
            ),
            const SizedBox(height: 50),
            const Text(
              "About kidcare",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your child's safety, our priority\n A secure mobile app designed to protect and\n care for children, ensuring peace of mind for\n parents everywhere.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 36, 36),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const dayBord(
                            title: '',
                          )),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
