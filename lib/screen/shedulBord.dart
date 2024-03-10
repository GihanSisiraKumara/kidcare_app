import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SheduleBord extends StatefulWidget {
  const SheduleBord({Key? key, required String title}) : super(key: key);

  @override
  _SheduleState createState() => _SheduleState();
}

class _SheduleState extends State<SheduleBord> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _leaveHome = TextEditingController();
  final TextEditingController _arrivalscool = TextEditingController();
  final TextEditingController _dispatcherscool = TextEditingController();
  final TextEditingController _inhome = TextEditingController();
  final TextEditingController _inattenance = TextEditingController();
  final TextEditingController _outattenance = TextEditingController();
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                          controller: _date,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.grey,
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
                              color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                                color: Colors.grey,
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
                                color: Colors.grey,
                              ),
                            ),
                            label: const Text(
                              'Out School',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            )),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {},
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
                                  color: Colors.white),
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
