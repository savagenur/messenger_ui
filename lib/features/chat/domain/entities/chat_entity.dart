import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChatEntity extends Equatable {
  final String name;
  final bool isOnline;
  final String timeSent;
  final String lastMessage;
  final LinearGradient color;
  const ChatEntity({
    required this.name,
    required this.color,
     this.isOnline=true,
    required this.timeSent,
    required this.lastMessage,
  });

  @override
  List<Object?> get props => [
        name,
        isOnline,
        timeSent,
        lastMessage,
        color,
      ];

  ChatEntity copyWith({
    String? name,
    bool? isOnline,
    String? timeSent,
    String? lastMessage,
    LinearGradient? color,
  }) {
    return ChatEntity(
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
      timeSent: timeSent ?? this.timeSent,
      lastMessage: lastMessage ?? this.lastMessage,
      color: color ?? this.color,
    );
  }

  String get profileText => name.split(" ").map((e) => e[0]).toList().join();
}
