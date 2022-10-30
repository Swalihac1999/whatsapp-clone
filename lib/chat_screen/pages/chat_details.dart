import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatapp_clone/chat_screen/models/chatModel.dart';
import 'package:whatapp_clone/chat_screen/models/single_chatModal.dart';
import 'package:whatapp_clone/chat_screen/pages/chatBable.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.user});
  UserDetails user;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final _messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool showSent = false;
  bool showEmoji = false;

  List<SingleChatModl> buble = [
    SingleChatModl(
        isSent: true, isReaded: false, message: 'hai', sentAt: '3 PM'),
    SingleChatModl(
        isSent: false, isReaded: false, message: 'hello', sentAt: '2 PM'),
    SingleChatModl(
        isSent: true, isReaded: true, message: 'habibi', sentAt: '1 PM'),
    SingleChatModl(
        isSent: false, isReaded: false, message: 'kayya', sentAt: '8 PM'),
    SingleChatModl(
        isSent: true, isReaded: true, message: 'kitharr', sentAt: '1 PM'),
    SingleChatModl(
        isSent: false, isReaded: true, message: 'mattancheeri', sentAt: '1 PM'),
  ];
  var datetime = DateTime.now();

  void setBubles() {
    var time = '${datetime.hour}:${datetime.minute}am';
    setState(() {
      buble.add(SingleChatModl(
          isReaded: true,
          isSent: true,
          message: _messageController.text,
          sentAt: time));
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            CircleAvatar(
              backgroundImage: (widget.user.image == '')
                  ? AssetImage(widget.user.isGroup!
                      ? 'assets/images/group.png'
                      : 'assets/images/person.jpeg') as ImageProvider<Object>?
                  : NetworkImage(widget.user.image!),
            )
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.name.toString()),
            Text(widget.user.updatedAt.toString()),
          ],
        ),
        actions: [
          // ignore: prefer_const_constructors
          Icon(Icons.call),
          const SizedBox(width: 20),
          const Icon(Icons.video_call),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text(widget.user.isGroup == true
                      ? 'group info'
                      : 'View contact')),
              PopupMenuItem(
                  child: Text(widget.user.isGroup == true
                      ? 'group media'
                      : 'Media,links,and docs')),
              const PopupMenuItem(child: Text('Search')),
              const PopupMenuItem(child: Text('Mute notifications')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('More')),
            ];
          })
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/WhatsApp Image 2022-10-12 at 10.08.54 PM.jpeg',
              width: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: buble.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBable(
                  bableList: buble[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        // ignore: sort_child_properties_last
                        child: TextField(
                          focusNode: focusNode,
                          onTap: () {
                            setState(() {
                              showEmoji = false;
                            });
                          },
                          controller: _messageController,
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                showSent = true;
                              });
                            } else {
                              setState(() {
                                showSent = false;
                              });
                            }
                            // print(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'message',
                            prefixIcon: IconButton(

                              icon: Icon(showEmoji
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions_outlined),
                              onPressed: () {
                                setState(() {
                                  showEmoji = !showEmoji;
                                  showEmoji?FocusManager.instance.primaryFocus
                                  ?.unfocus():focusNode.requestFocus();
                                });
                              },
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => menu(),
                                      );
                                    },
                                    icon: const Icon(Icons.attach_file)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.currency_rupee)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt)),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setBubles();
                      },
                      child: Icon(showSent ? Icons.send : Icons.mic),
                    )
                  ],
                ),
                Offstage(
                  offstage: !showEmoji,
                  child: SizedBox(
                      height: 300,
                      child: EmojiPicker(
                        textEditingController: _messageController,
                      )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      height: 300,
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget(
                    icon: const Icon(Icons.insert_drive_file),
                    color: const Color.fromARGB(255, 220, 122, 237),
                    text: 'Document'),
                iconWidget(
                    icon: const Icon(Icons.camera_alt),
                    color: const Color.fromARGB(255, 168, 42, 23),
                    text: 'Cemara'),
                iconWidget(
                    icon: const Icon(Icons.insert_photo),
                    color: Colors.purple,
                    text: 'Gallary'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget(
                    icon: const Icon(Icons.headset),
                    color: Colors.deepOrangeAccent,
                    text: 'Audio'),
                iconWidget(
                    icon: const Icon(Icons.location_pin),
                    color: Colors.blueGrey,
                    text: 'Location'),
                iconWidget(
                    icon: const Icon(Icons.contact_phone),
                    color: Colors.blue,
                    text: 'Contact')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                iconWidget(
                    icon: const Icon(Icons.currency_rupee),
                    color: const Color.fromARGB(255, 20, 120, 24),
                    text: 'Payment')
              ],
            )
          ],
        ),
      ),
    );
  }

  Column iconWidget({
    String? text,
    Icon? icon,
    Color? color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!)
      ],
    );
  }
}

// Widget selectEmoji() {
//   return EmojiPicker(
//     onEmojiSelected: (emoji, category) {},
//   );
// }
