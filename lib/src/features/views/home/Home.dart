// import 'package:falad_rooms/src/styles/text_style.dart';

import 'package:flutter/material.dart';
import 'package:fogaan_rooms/src/styles/button_styles.dart';
import 'package:fogaan_rooms/src/styles/text_style.dart';

import '../../../constants/texts.dart';
import '../components/room_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      appName,
                      style: AppStyles.logoHeadingStyle(Colors.blue),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: NormalButtonStyles.elevatedButtonStyle(
                                Colors.transparent, Colors.white70),
                            onPressed: () {
                              showCreateRoomDialog(context);
                            },
                            child: const Text('Create')),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Container(
                            color: Colors.white70,
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(12.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    onlineRooms,
                    style: AppStyles.normalStyle(Colors.white),
                  )),
              const RoomCards(),
              // Text("Hello Hello")
            ],
          ),
        ),
      ),
    );
  }

  void showCreateRoomDialog(BuildContext context) {
    TextEditingController roomNameController = TextEditingController();
    TextEditingController roomTopicController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create new room'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  controller: roomNameController,
                  decoration:
                      const InputDecoration(hintText: "Enter Room Name"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: roomTopicController,
                  decoration:
                      const InputDecoration(hintText: "Enter Room Topic"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                OutlinedButton(
                  child: const Text('Cretae Room'),
                  onPressed: () {
                    // Handle the submit action
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
