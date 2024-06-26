import 'package:flutter/material.dart';
import 'package:kidcare/screen/doneBord.dart';
import 'package:lottie/lottie.dart';

class aboutbellBord extends StatelessWidget {
  const aboutbellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              child: Lottie.asset('assets/animations/Animation - bell.json'),
            ),
            const SizedBox(height: 10),
            const Text(
              "Bell Approach!",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Unlock a world of timely updates\n and gentle reminders! Stay tuned to all the little moments that matter with our KidCare app's\n delightful notification hub.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 36, 36),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const doneBord(
                      title: '',
                    ),
                  ),
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
