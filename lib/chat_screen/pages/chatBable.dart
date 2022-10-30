// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatapp_clone/chat_screen/models/single_chatModal.dart';

class ChatBable extends StatelessWidget {
  ChatBable({super.key, required this.bableList});
  SingleChatModl bableList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          bableList.isSent! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
            color: bableList.isSent! ? const Color(0xffdcf8c6) : Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 7, right: 60, bottom: 10),
                  child: Text(bableList.message!),
                ),
                Positioned(
                  bottom: 1,
                  right: 2,
                  child: Row(
                    children: [
                      Text(bableList.sentAt!, style: const TextStyle(fontSize: 10)),
                      Icon(
                        Icons.done_all,
                        color: bableList.isReaded! ? Colors.blue : Colors.grey,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
