import "package:flutter/material.dart";
import "package:flutter_lucide/flutter_lucide.dart";

class SingleChatView extends StatefulWidget {
  final int id;

  const SingleChatView({
    required this.id,
    super.key
  });

  @override
  State<SingleChatView> createState() => _SingleChatViewState();
}

class _SingleChatViewState extends State<SingleChatView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"),),
      body: Column(
        children: [
          Text("Hello number ${widget.id}"),
          BottomInputArea()
        ]
      )
    );
  }
}

class BottomInputArea extends StatefulWidget {
  const BottomInputArea({super.key});

  @override
  State<BottomInputArea> createState() => _BottomInputAreaState();
}

class _BottomInputAreaState extends State<BottomInputArea> {
  bool showEmoji = false;
  bool showKeyboard = false;
  bool showAttachmentOptions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade800,
                hintText: "Message",
                prefixIcon: IconButton(
                  onPressed: () {
                    // Handle emoji or other action
                  },
                  icon: Icon(LucideIcons.smile),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          InkWell(
            onTap: () {
              // Handle mic or send
            },
            child: Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.green.shade500
              ),
              child:Icon(LucideIcons.mic, size: 20, color: Colors.blueGrey,),
            )
          )
        ],
      ),
    );
  }
}
