import 'package:flutter/material.dart';
import 'package:whatapp_clone/chat_screen/models/chatModel.dart';
import 'package:whatapp_clone/chat_screen/pages/chat_details.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.userdata}) : super(key: key);
  UserDetails userdata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatDetails(user: userdata)))),
      leading: CircleAvatar(
        backgroundImage: (userdata.image == '')
            ? AssetImage(userdata.isGroup!
                ? 'assets/images/group.png'
                : 'assets/images/person.jpeg') as ImageProvider<Object>?
            : NetworkImage(userdata.image!),
      ),
      title: Text(userdata.name!),
      subtitle: Text(userdata.message!),
      trailing: Text(userdata.updatedAt!),
      
    );
  }
}
