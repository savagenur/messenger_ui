import 'package:bloc/bloc.dart';
import 'package:messenger_ui/features/chat/data/datasources/mocks/messages.dart';
import 'package:messenger_ui/features/chat/domain/entities/message_entity.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit()
      : super(ChatState(
          kMessages,
        ));
  void updateMessages(MessageEntity message) {
    final messages = state.messages..add(message);
    emit(ChatState(messages));
  }
}
