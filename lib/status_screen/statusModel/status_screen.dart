import 'package:flutter/material.dart';
import 'package:whatapp_clone/status_screen/statusModel/status_Model.dart';
import 'package:whatapp_clone/status_screen/statusModel/status_tile.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  List<UserStatus> Datas = [
    UserStatus(
      name: 'swalih',
      status: '',
      image: 'image',
      updatedAt: '2Am',
    ),
    UserStatus(
      name: 'thrisha',
      status: '',
      image: 'image',
      updatedAt: '8Am',
    ),
    UserStatus(
      name: 'favas',
      status: '',
      image: 'image',
      updatedAt: '7am',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Datas.length,
          itemBuilder: (BuildContext context, int index) {
            return StatusTile(userss: Datas[index],
            );
          }),
    );
  }
}
