import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kidcare/screen/loginScreen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key, required String title});

  @override
  RegScreenState createState() => RegScreenState();
}

class RegScreenState extends State<RegScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  bool isParent = false;
  bool isChild = false;

  Future<void> insertrecord() async {
    if (name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        address.text.isNotEmpty) {
      try {
        String tableName = isParent ? "parent" : "children";
        String uri = "http://10.0.2.2/kidcareuser/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "phone": phone.text,
          "password": password.text,
          "address": address.text,
          "table_name": tableName,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Insert Successfull!");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else {
          print("Some Issue found!");
        }
      } catch (e) {
        print(e);
      }
    } else {
      //print("please fill all the fileds");
      _showErrorDialog(
        'Please fill all the fileds and try again.',
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register Error'),
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
              // image: DecorationImage(
              // image: AssetImage('assets/images/regscreenbackground.jpg')
              // ),
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: const Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Row(
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 247, 245, 245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 80), // Space between text and image
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
            padding: const EdgeInsets.only(
              top: 250.0,
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                //color: Color.fromARGB(255, 252, 251, 251),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/red.jpg"), // Replace "my background image.jpg" with your image file
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Sign Up Here',
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
                              color: Color.fromARGB(255, 19, 18, 18),
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
                        controller: phone,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.phone_android,
                              color: Color.fromARGB(255, 27, 25, 25),
                            ),
                            label: Text(
                              'Phone Number',
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
                              color: Color.fromARGB(255, 13, 12, 12),
                            ),
                            label: Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      TextField(
                        controller: address,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Color.fromARGB(255, 21, 19, 19),
                            ),
                            label: Text(
                              'Address',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color.fromARGB(255, 233, 35, 52),
                            value: isParent,
                            onChanged: (bool? value) {
                              setState(() {
                                isParent = value ?? false;
                                if (isParent) {
                                  isChild = false;
                                }
                              });
                            },
                          ),
                          const Text(
                            " Parent",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                        ],
                      ),
                      //const SizedBox(height: 0),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color.fromARGB(255, 233, 35, 52),
                            value: isChild,
                            onChanged: (bool? value) {
                              setState(() {
                                isChild = value ?? false;
                                if (isChild) {
                                  isParent = false;
                                }
                              });
                            },
                          ),
                          const Text(
                            " Child",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const SizedBox(
                      // height: 70,
                      // ),
                      GestureDetector(
                        onTap: () {
                          insertrecord();
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
                              'SIGN UP',
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 51, 53, 56)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 63, 108, 157)),
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
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
