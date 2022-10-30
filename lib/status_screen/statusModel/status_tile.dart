import 'package:flutter/material.dart';
import 'package:whatapp_clone/status_screen/statusModel/status_Model.dart';

class StatusTile extends StatelessWidget {
  StatusTile({Key? key,required this.userss}) : super(key: key);
  UserStatus userss;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(userss.name!),
      subtitle: Text(userss.image!)
    );
  }
}
