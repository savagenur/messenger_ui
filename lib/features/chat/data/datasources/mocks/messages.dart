import 'package:messenger_ui/features/chat/domain/entities/message_entity.dart';

List<MessageEntity> kMessages = [
  MessageEntity(
    text: "Сделай мне кофе, пожалуйста",
    date: DateTime(
      2022,
      1,
      27,
      21,
      41,
    ),
  ),
  MessageEntity(
    text: "Окей",
    date: DateTime(
      2022,
      1,
      27,
      21,
      41,
    ),
    isMe: false,
  ),
  MessageEntity(
    text: "Уже сделал?",
    date: DateTime.now(),
  ),
];
