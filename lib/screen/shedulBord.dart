import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kidcare/screen/pinwayBord.dart';

class SheduleBord extends StatefulWidget {
  const SheduleBord({Key? key, required String title}) : super(key: key);

  @override
  _SheduleState createState() => _SheduleState();
}

class _SheduleState extends State<SheduleBord> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _leaveHome = TextEditingController();
  final TextEditingController _arrivalscool = TextEditingController();
  final TextEditingController _dispatcherscool = TextEditingController();
  final TextEditingController _inhome = TextEditingController();
  final TextEditingController _inattenance = TextEditingController();
  final TextEditingController _outattenance = TextEditingController();

  Future<void> shedulrecord() async {
    if (_name.text != "" ||
        _date.text != "" ||
        _leaveHome.text != "" ||
        _arrivalscool.text != "" ||
        _dispatcherscool.text != "" ||
        _inhome.text != "" ||
        _inattenance.text != "" ||
        _outattenance.text != "") {
      try {
        String uri = "http://10.0.2.2/kidcareuser/sheduling.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": _name.text,
          "date": _date.text,
          "leavehome": _leaveHome.text,
          "arrivalschool": _arrivalscool.text,
          "dispachscool": _dispatcherscool.text,
          "inhome": _inhome.text,
          "inattendance": _inattenance.text,
          "outattendance": _outattenance.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Insert Successfull!");
          // Navigator.push(
          // context,
          // MaterialPageRoute(
          // builder: (context) => const MyHomePage(),
          // ),
          // );
        } else {
          print("Some Issue found!");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please fill all the fileds");
      // Navigator.push
      // (
      // context,
      // MaterialPageRoute(
      // builder: (context) => MyHomePage(),
      // ),
      // );
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
              padding: EdgeInsets.only(top: 10.0, left: 70),
              child: Text(
                'Sheduler Your\nDayly Task',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 246, 242, 242),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/red.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Color.fromARGB(255, 247, 243, 243),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Enter date & Time",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 206, 77, 77),
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 13, 11, 11),
                          ),
                          label: Text(
                            'Your user name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                          controller: _date,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color.fromARGB(255, 20, 17, 17),
                            ),
                            label: Text(
                              'Day',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            ),
                          ),
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                _date.text =
                                    DateFormat('yyyy-MM-dd').format(pickeddate);
                              });
                            }
                          }),
                      TextField(
                        controller: _leaveHome,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (pickedTime != null) {
                                setState(() {
                                  _leaveHome.text = pickedTime.format(
                                      context); // Format the selected time
                                });
                              }
                            },
                            child: const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 15, 12, 12),
                            ),
                          ),
                          label: const Text(
                            'Leave at Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        controller: _arrivalscool,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _arrivalscool.text = pickedTime.format(
                                        context); // Format the selected time
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 22, 18, 18),
                              ),
                            ),
                            label: const Text(
                              'Arrival at School',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      TextField(
                        controller: _dispatcherscool,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _dispatcherscool.text = pickedTime.format(
                                        context); // Format the selected time
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 13, 11, 11),
                              ),
                            ),
                            label: const Text(
                              'Dispatcher at School',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      TextField(
                        controller: _inhome,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _inhome.text = pickedTime.format(
                                        context); // Format the selected time
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 20, 17, 17),
                              ),
                            ),
                            label: const Text(
                              'In home Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Attendance",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 206, 77, 77),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _inattenance,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _inattenance.text = pickedTime.format(
                                        context); // Format the selected time
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 14, 11, 11),
                              ),
                            ),
                            label: const Text(
                              'In  School',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _outattenance,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  _outattenance.text = pickedTime.format(
                                      context); // Format the selected time
                                });
                              }
                            },
                            child: const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 11, 10, 10),
                            ),
                          ),
                          label: const Text(
                            'Out School',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          shedulrecord();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const pinwayBord(
                                      title: '',
                                    )),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 209, 56, 45)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Pin your Way',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          shedulrecord();
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
                              'Sheduling',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 247, 241, 241)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
