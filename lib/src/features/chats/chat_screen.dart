import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:http/http.dart' as http;

// Classes used as type. Not ts but who cares
class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unread;

  const ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unread
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(name: json['name'], message: json['message'], time: json['time'], unread: json['unread']);
  }
}

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}
class _ChatSectionState extends State<ChatSection> {
  List<ChatItem> chatData = [];

  @override void initState() {
    super.initState();
    fetchPosts();
  }

  void setChatData(data) {
    setState(() {
      chatData = data;
    });
  }

  void fetchPosts() async {
    final url = Uri.parse("http://192.168.88.99:3000/messages");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<ChatItem> data = jsonList.map((json) => ChatItem.fromJson(json)).toList();
        setChatData(data);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in chatData)
              ChatBarItem(name: item.name, message: item.message, time: item.time, unread: item.unread,)
          ],
        )
    );
  }
}

class  ChatBarItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unread;

  const ChatBarItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unread
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset("assets/images/moon_knight.jpg", height: 70, width: 70, fit: BoxFit.cover, ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Wrap this Column in Expanded!
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Right column stays the same
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: Colors.green[600]),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green[600]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(unread.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 15)),
                          ]
                        )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}