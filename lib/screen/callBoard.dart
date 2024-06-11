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
        centerTitle: true,
        title: const Text(
          "Call",
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 250, 202, 202),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all<double>(30),
            iconColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 252, 251, 251)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 234, 117, 117)),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
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
            image: AssetImage('assets/images/red.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
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
                            backgroundColor:
                                const Color.fromARGB(255, 238, 28, 28),
                          )
                        ],
                      ),
                      child: ListTile(
                        isThreeLine:
                            false, //get more space in each notification container.
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.08),
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/images/q.webp"),
                        ),
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Missed Call",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "2h Ago",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                        subtitle: const Text(
                          "You have 1 missed call from 0767301727. last call at 2:00pm",
                          style:
                              TextStyle(color: Color.fromARGB(255, 11, 11, 11)),
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
              GestureDetector(
                onTap: callNumber,
                child: const Padding(
                  padding: EdgeInsets.all(70.0),
                  child: Center(
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: 67,
                        backgroundImage: AssetImage('assets/images/call.avif'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
