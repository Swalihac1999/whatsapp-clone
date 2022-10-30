import 'package:flutter/material.dart';
import 'package:whatapp_clone/call_screen/call_model/calls_tile.dart';
import 'package:whatapp_clone/call_screen/call_model/call_models.dart';

class call_screen extends StatelessWidget {
  call_screen({super.key});
  List<Callusers> calls = [
    Callusers(
        name: 'Swalih',
        isGroup: false,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxVu5Q8f6xrJZQ3gwh2Fvs6hR8Xr6Zsg2fbzSkf-vMWk3DPI-96OJ_ZEyxkfVjg0OwKxc&usqp=CAU',
        updatedAt: '5Am'),
    Callusers(name: 'family', isGroup: true, image: '', updatedAt: '8Am'),
    Callusers(
        name: 'flutter',
        isGroup: true,
        image: 'https://im.rediff.com/news/2019/apr/16modi1.jpg?w=670&h=900',
        updatedAt: '2Am'),
    Callusers(name: 'favas', isGroup: false, image: '', updatedAt: '2Am'),
    Callusers(
        name: 'nishad',
        isGroup: false,
        image:
            'https://image.cnbcfm.com/api/v1/image/106689818-1599150563582-musk.jpg?v=1653411695',
        updatedAt: '7Am'),
    Callusers(
        name: 'fihi',
        isGroup: false,
        image:
            'https://images.unsplash.com/photo-1529123202249-4f6224196c9b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVhbCUyMHBlcnNvbnxlbnwwfHwwfHw%3D&w=1000&q=80',
        updatedAt: '7Am')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (BuildContext context, int index) {
          return CallsTile(callData: calls[index]);
        },
      ),
    );
  }
}
