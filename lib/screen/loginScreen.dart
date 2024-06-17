import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kidcare/screen/dashBord.dart';
import 'package:kidcare/screen/forgotpBord.dart';
import 'package:kidcare/screen/regScreen.dart';
import 'package:kidcare/screen2/adminBord.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String title});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async {
    var uri = "http://10.0.2.2/kidcareuser/login.php";
    final response = await http.post(Uri.parse(uri), body: {
      'name': name.text,
      'password': password.text,
    });
    if (response.statusCode == 200) {
      // final result = jsonDecode(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      if (data['isParent']) {
        print("Login Successfull!");
        // Navigator.pushReplacementNamed(context, '/DashBord');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const adminBord(),
          ),
        );
      } else if (data['isChild']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBord(
              title: '',
              name: '',
            ),
          ),
        );
      } else {
        // Handle incorrect login credentials
        //print("Invalid login credentials");
        _showErrorDialog(
          'Invalid username or password. Please try again.',
        );
      }
    } else {
      // Handle error
      print("Error: ${response.statusCode}");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Row(
                    children: [
                      Text(
                        'KIDCARE',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 247, 245, 245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20), // Space between text and image
                      CircleAvatar(
                        radius:
                            80, // Adjust the radius to fit the size you want
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                image: DecorationImage(
                  image: AssetImage("assets/images/red.jpg"), //
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Wellcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 253, 252, 252),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: name,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 18, 18, 18),
                          ),
                          label: Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          )),
                    ),
                    TextField(
                      controller: password,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Color.fromARGB(255, 6, 5, 5),
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add your logic for handling forgot password here
                          // For example, you can show a dialog or navigate to a forgot password screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotpBord(
                                      title: '',
                                    )),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 94, 118, 198),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your sign-in logic here
                        login();
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color(0xffB81736),
                            Color(0xff281537),
                          ]),
                        ),
                        child: const Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login with Social Media',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 44, 15, 15)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tab(icon: Image.asset("assets/images/facebook1.png")),
                        Tab(icon: Image.asset("assets/images/instergram.png")),
                        Tab(icon: Image.asset("assets/images/google.webp")),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 33, 25, 25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to the registration screen (RegScreen)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegScreen(
                                          title: '',
                                        )),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(255, 66, 94, 172),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
