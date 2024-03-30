
import 'package:flutter/material.dart';
import 'package:fogaan_rooms/src/styles/button_styles.dart';
import 'package:fogaan_rooms/src/styles/text_style.dart';

import '../../../constants/texts.dart';

class RoomCards extends StatelessWidget {
  const RoomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width * 1,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ? : Room Topic
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      roomTopic,
                      style: AppStyles.headingTwoStyle(Colors.white),
                    ),
                  ),
                  //  ? : Room Sub Topic
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      roomSubTopic,
                      style: AppStyles.mediumSmallStyle(
                          Colors.white.withOpacity(0.8)),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.person_2)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share_rounded,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                style: AppButtonStyles.elevatedButtonStyle(
                                    Colors.white, Colors.lightBlue),
                                onPressed: () {},
                                child: const Text("Join Now!"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
