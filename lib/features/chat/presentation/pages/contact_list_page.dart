import 'package:flutter/material.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/chats.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';
import 'package:messenger_ui/features/chat/domain/entities/chat_entity.dart';
import 'package:messenger_ui/features/chat/presentation/pages/chat_page.dart';
import 'package:messenger_ui/features/chat/presentation/widgets/circle_profile.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Padding(
            padding: DesignDimens.hugePadding.horizontal,
            child: _buildTextField(),
          ),
          DesignDimens.largeEmptiness.verticalBox,
          Expanded(
            child: ListView.builder(
              itemCount: kChats.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = kChats[index];
                return _chatItem(chat, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  TextField _buildTextField() {
    return const TextField(
      decoration: InputDecoration(
        fillColor: Color(0xFFEDF2F6),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: DesignDimens.mediumPadding,
          vertical: DesignDimens.largePadding,
        ),
        hintText: "Поиск",
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFF9DB6CA),
        ),
        hintStyle: TextStyle(
          color: Color(0xFF9DB6CA),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }

  ListTile _chatItem(ChatEntity chat, BuildContext context) {
    return ListTile(
      shape: const Border.symmetric(
        horizontal: BorderSide(
          color: Color(0xFFEDF2F6),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              chat: chat,
            ),
          )),
      minVerticalPadding: 0,
      contentPadding: DesignDimens.hugePadding.horizontal,
      leading: CircleProfile(
        color: chat.color,
        title: chat.profileText,
      ),
      horizontalTitleGap: 12,
      trailing: Column(
        children: [
          Text(
            chat.timeSent,
            style: const TextStyle(
              color: Color(0xFF5D7A90),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )
        ],
      ),
      title: Text(
        chat.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          height: 0,
        ),
      ),
      subtitle: Text(
        chat.lastMessage,
        style: const TextStyle(
          color: Color(0xFF5D7A90),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Чаты',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF2B333E),
          fontSize: 32,
        ),
      ),
    );
  }
}
