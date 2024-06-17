import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class bellBord extends StatelessWidget {
  const bellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Emergency Bell!",
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/red2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: 'Your Emergency alert is going to owner!',
                    );
                  },
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/ebell2.jpg'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 130,
                  height: 50,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 206, 80, 105),
                          Color.fromARGB(255, 92, 67, 111)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: 'Do you want to Disable Bell',
                          confirmBtnText: 'Yes',
                          cancelBtnText: 'No',
                          confirmBtnColor: Colors.green,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Disable Bell',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                itemProfile(
                  'Deseble bell',
                  'You have deseble bell                       1m',
                  CupertinoIcons.person,
                ),
                const SizedBox(height: 20),
                itemProfile('Bell on',
                    'Your bell is ringing now                    5m'),
                const SizedBox(height: 20),
                itemProfile('Turn on bell',
                    'Your bell is ringinh in 2 sec               4h'),
                const SizedBox(height: 20),
                itemProfile('Deseble bell',
                    'You deseble bell                                 4h'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Bell on',
                    'Your bell is ringing now                    4m'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Turn on bell',
                    'Your bell is ringinh in 2 sec               6h'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Bell on',
                    'Your bell is ringing now                    1d'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Deseble bell',
                    'You have deseble bell                       2d'),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, [IconData? iconData]) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 244, 244),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: const Color.fromARGB(255, 33, 30, 30).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 2)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/q.webp"),
        ),
        // trailing: const Icon(Icons.arrow_forward,
        // color: Color.fromARGB(255, 17, 13, 13)),
        // tileColor: Colors.white,
      ),
    );
  }
}
