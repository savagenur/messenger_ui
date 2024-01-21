import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/messages.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';
import 'package:messenger_ui/features/chat/domain/entities/message_entity.dart';
import 'package:messenger_ui/features/chat/presentation/bloc/cubit/chat_cubit.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({
    super.key,
  });

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  final TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DesignDimens.largePadding.horizontalBox,
        _buildBtn(Icons.attach_file_rounded),
        DesignDimens.mediumPadding.horizontalBox,
        Expanded(
          child: TextField(
            controller: messageController,
            onSubmitted: (value) {
              final message = MessageEntity(
                text: value,
                date: DateTime.now(),
              );
              if (value.isNotEmpty) {
                context.read<ChatCubit>().updateMessages(message);
              }
              messageController.clear();
            },
            minLines: 1,
            maxLines: 5,
            style: TextStyle(
              fontSize: 16,
            ),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEDF2F6),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: DesignDimens.bigPadding),
              hintText: "Сообщение",
            ),
          ),
        ),
        DesignDimens.mediumPadding.horizontalBox,
        _buildBtn(Icons.mic_none_sharp),
        DesignDimens.largePadding.horizontalBox,
      ],
    );
  }

  Container _buildBtn(IconData iconData) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(6),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFEDF2F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Icon(
        iconData,
      ),
    );
  }
}
