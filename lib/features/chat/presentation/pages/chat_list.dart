
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/messages.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';
import 'package:messenger_ui/features/chat/domain/entities/message_entity.dart';
import 'package:messenger_ui/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:messenger_ui/features/chat/presentation/widgets/my_message.dart';
import 'package:messenger_ui/features/chat/presentation/widgets/sender_message.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, });

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController messageController = ScrollController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      messageController.jumpTo(messageController.position.maxScrollExtent);
    });
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, chatState) {
        return GroupedListView<MessageEntity, DateTime>(
          controller: messageController,
          elements: chatState.messages,
          groupBy: (msg) =>
              DateTime(msg.date.year, msg.date.month, msg.date.day),
          groupSeparatorBuilder: (date) => buildGroupSeparator(date),
          indexedItemBuilder: (context, banquet, pos) =>
              buildBanquetItem(context, banquet),
        );
      },
    );
  }

  Widget buildBanquetItem(BuildContext context, MessageEntity message) {
    if (message.isMe) {
      return MyMessage(message: message);
    }
    return SenderMessage(message: message);
  }

  Widget buildGroupSeparator(DateTime date) {
    final formatedDate = DateFormat("d.MM.y").format(date) ==
            DateFormat("d.MM.y").format(DateTime.now())
        ? "Сегодня"
        : DateFormat("d.MM.y").format(date);
    return Padding(
      padding: DesignDimens.bigPadding.vertical,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
              left: DesignDimens.largePadding,
              right: DesignDimens.bigPadding,
            ),
            child: Divider(),
          )),
          Text(
            formatedDate,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9DB6CA),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
              left: DesignDimens.bigPadding,
              right: DesignDimens.largePadding,
            ),
            child: Divider(),
          )),
        ],
      ),
    );
  }
}
