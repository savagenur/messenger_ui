import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/chats.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/messages.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';
import 'package:messenger_ui/features/chat/domain/entities/chat_entity.dart';
import 'package:messenger_ui/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:messenger_ui/features/chat/presentation/pages/contact_list_page.dart';

void main() {
  runApp(const MessengerApp());
}

class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Messenger UI",
        theme: _buildAppTheme(),
        home: const ContactListPage(),
      ),
    );
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignDimens.largeRadius),
            gapPadding: DesignDimens.smallPadding,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignDimens.largeRadius),
            borderSide: BorderSide(width: .5, color: Colors.grey),
            gapPadding: DesignDimens.smallPadding,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignDimens.largeRadius),
            gapPadding: DesignDimens.smallPadding,
          ),
        ));
  }
}
