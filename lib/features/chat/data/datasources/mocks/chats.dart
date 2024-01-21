import 'package:flutter/material.dart';
import 'package:messenger_ui/features/chat/domain/entities/chat_entity.dart';

const List<ChatEntity> kChats = [
  ChatEntity(
    color: LinearGradient(
      begin: Alignment(0, 1),
      end: Alignment(0, 1),
      colors: [Color(0xFF1EDA5E), Color(0xFF31C764)],
    ),
    name: "Виктор Власов",
    timeSent: "Вчера",
    lastMessage: "Вы: Уже сделал?",
  ),
  ChatEntity(
    color: LinearGradient(
      begin: Alignment(0, 1),
      end: Alignment(0, 1),
      colors: [Color(0xFFF66700), Color(0xFFEC3800)],
    ),
    name: "Саша Алексеев",
    timeSent: "12.01.22",
    lastMessage: "Я готов",
  ),
  ChatEntity(
    color: LinearGradient(
      begin: Alignment(0, 1),
      end: Alignment(0, 1),
      colors: [Color(0xFF00ACF6), Color(0xFF006CEC)],
    ),
    name: "Пётр Жаринов",
    timeSent: "2 минуты назад",
    lastMessage: "Вы: Я вышел",
  ),
  ChatEntity(
    color: LinearGradient(
      begin: Alignment(0, 1),
      end: Alignment(0, 1),
      colors: [Color(0xFFF66700), Color(0xFFEC3800)],
    ),
    name: "Алина Жукова",
    timeSent: "09:23",
    lastMessage: "Вы: Я вышел",
  ),
];
