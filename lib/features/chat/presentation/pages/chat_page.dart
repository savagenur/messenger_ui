import 'package:flutter/material.dart';
import 'package:messenger_ui/features/chat/domain/entities/chat_entity.dart';
import 'package:messenger_ui/features/chat/presentation/pages/bottom_chat_field.dart';
import 'package:messenger_ui/features/chat/presentation/pages/chat_list.dart';
import 'package:messenger_ui/features/chat/presentation/widgets/circle_profile.dart';

class ChatPage extends StatefulWidget {
  final ChatEntity chat;
  const ChatPage({super.key, required this.chat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatEntity _chat;
  @override
  void initState() {
    super.initState();
    _chat = widget.chat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
                child: ChatList(),
              ),
          BottomChatField(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      title: ListTile(
        shape: const Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xFFEDF2F6),
          ),
        ),
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.all(0),
        leading: CircleProfile(
          color: _chat.color,
          title: _chat.profileText,
        ),
        horizontalTitleGap: 12,
        title: Text(
          _chat.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            height: 0,
          ),
        ),
        subtitle: Text(
          _chat.isOnline ? "В сети" : "Офлайн",
          style: const TextStyle(
            color: Color(0xFF5D7A90),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
    );
  }
}
