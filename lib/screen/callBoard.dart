import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class CallBoard extends StatefulWidget {
  const CallBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CallBoardState createState() => _CallBoardState();
}

class _CallBoardState extends State<CallBoard> {
  final Uri dialNumber = Uri(scheme: 'tel', path: '0767301727');

  void callNumber() async {
    await launch(dialNumber.toString());
  }

  void directCall() async {
    await FlutterPhoneDirectCaller.callNumber('0767301727');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        icon: Icons.reply,
                        backgroundColor: Colors.grey[300]!,
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        icon: Icons.delete,
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 238, 28, 28),
                      )
                    ],
                  ),
                  child: ListTile(
                    isThreeLine:
                        true, //get more space in eact nortification container.
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/call.avif"),
                    ),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good afternoon",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "2h Ago",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                    subtitle: const Text(
                      "plase fill all the text feild and conform that",
                      style: TextStyle(color: Color.fromARGB(255, 11, 11, 11)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) => Divider(
                    color: const Color.fromARGB(255, 200, 178, 178),
                    indent: size.width * .08,
                    endIndent: size.width * .08,
                  )),
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: callNumber,
                  icon: const Icon(
                    Icons.call,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Call',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 227, 227),
                    shape: const CircleBorder(),
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
