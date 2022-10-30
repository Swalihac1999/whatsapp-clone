import 'package:flutter/material.dart';
import 'call_models.dart';

class CallsTile extends StatelessWidget {
  CallsTile({Key? key, required this.callData}) : super(key: key);
  Callusers callData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: (callData.image == '')
            ? AssetImage(callData.isGroup!
                ? 'assets/images/group.png'
                : 'assets/images/person.jpeg') as ImageProvider<Object>?
            : NetworkImage(callData.image!),
      ),
      title: Text(callData.name!),
      
    );
  }
}
