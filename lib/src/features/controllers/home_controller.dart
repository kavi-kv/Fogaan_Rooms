import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fogaan_rooms/src/features/views/live_room/live_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final roomIDTextCtrl =
      TextEditingController(text: Random().nextInt(10000).toString());

  void jumpToLivePage(BuildContext context, String roomId, bool isHost) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(roomId: roomId, isHost: isHost),
      ),
    );
  }
}
