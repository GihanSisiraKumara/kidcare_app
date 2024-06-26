import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key, required this.title});
  final String title;

  @override
  RegScreenState createState() => RegScreenState();
}

class RegScreenState extends State<ConnectScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  bool isParent = false;
  bool isChild = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 250, 251),
        centerTitle: true,
        title: const Text(
          'Connect Owner',
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 250, 202, 202),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all<double>(30),
            iconColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 252, 251, 251)),
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 234, 117, 117)),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CircleAvatar(
                  radius: 100, // Adjust the radius to fit the size you want
                  backgroundImage: AssetImage('assets/images/paconnect.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: name,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.check,
                                    color: Color(0xffB81736),
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
                                    Icons.check,
                                    color: Color(0xffB81736),
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
                              controller: address,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.location_on,
                                    color: Color(0xffB81736),
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
                                  activeColor: const Color(0xffB81736),
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
                            const SizedBox(height: 0),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: const Color(0xffB81736),
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
                            GestureDetector(
                              onTap: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'Connect Completed Successfully!',
                                );
                                name.clear();
                                phone.clear();
                                password.clear();
                                address.clear();
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
                              height: 20,
                            ),
                            const Text(
                              'Connect your owner and safe their life',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
