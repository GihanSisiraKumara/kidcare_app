import 'package:flutter/material.dart';
import 'package:kidcare/screen/regScreen.dart';
import 'package:lottie/lottie.dart';

class doneBord extends StatelessWidget {
  const doneBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 215, 213),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 215, 213),
        centerTitle: true,
        title: const Text(
          '',
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 247, 84, 84),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all<double>(30),
            iconColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 252, 251, 251)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 240, 113, 113)),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              child: Lottie.asset('assets/animations/Animation - 2.json'),
            ),
            const SizedBox(height: 1),
            const Text(
              "Done!",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Everything is ready For you to start using the app.\n Enjoy the app and keep your child safe!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 36, 36),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegScreen(
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
                    'Register',
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
