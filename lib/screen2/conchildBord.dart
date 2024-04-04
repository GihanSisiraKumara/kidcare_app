import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kidcare/screen/loginScreen.dart';

class conchildBord extends StatefulWidget {
  const conchildBord({super.key, required String title});

  @override
  conchildBordState createState() => conchildBordState();
}

class conchildBordState extends State<conchildBord> {
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
      print("please fill all the fileds");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffB81736), Color(0xff281537)],
            ),
          ),
        ),
      ),
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
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 80),
              child: Text(
                'Connect Your\n     Parent',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 11, 10, 10),
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
                              Icons.phone,
                              color: Color.fromARGB(255, 15, 12, 12),
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
                              Icons.key_off,
                              color: Color.fromARGB(255, 15, 12, 12),
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
                              Icons.location_city,
                              color: Color.fromARGB(255, 12, 10, 10),
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
                            activeColor: Colors.green,
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
                          const Text(" Parent"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.green,
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
                          const Text(" Child"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                              'Connect',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
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