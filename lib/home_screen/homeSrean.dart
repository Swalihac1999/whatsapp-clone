import 'package:flutter/material.dart';
import 'package:whatapp_clone/call_screen/call_model/call_screen.dart';
import 'package:whatapp_clone/camera/camera_screen.dart';
import 'package:whatapp_clone/chat_screen/chat_screen.dart';
import 'package:whatapp_clone/status_screen/statusModel/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text('New Group betaaa')),
                  PopupMenuItem(child: Text('New broadcast')),
                  PopupMenuItem(child: Text('Linked devices')),
                  PopupMenuItem(child: Text('starred massages')),
                  PopupMenuItem(child: Text('settings')),
                ];
              },
            )
          ],
          bottom: TabBar(controller: _controller, tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'chats',
            ),
            Tab(
              text: 'status',
            ),
            Tab(
              text: 'CALLS',
            )
          ]),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            CameraScreen(),
            ChatScreen(),
            UserScreen(),
            call_screen(),
          ],
        ));
  }
}
