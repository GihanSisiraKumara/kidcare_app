import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class notificationBord extends StatelessWidget {
  const notificationBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 178, 173),
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search notification",
                  contentPadding: const EdgeInsets.all(16.0),
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
          const SizedBox(height: 10),
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
                      backgroundImage: AssetImage("assets/images/kidcare.png"),
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
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
