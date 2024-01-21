import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String text;
  final DateTime date;
  final bool isMe;
  const MessageEntity({
    required this.text,
    required this.date,
    this.isMe = true,
  });

  @override
  List<Object?> get props => [
        text,
        date,
        isMe,
      ];
}
