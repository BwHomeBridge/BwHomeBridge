part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required bool isLoading,
    required List<Message> messages,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        isLoading: false,
        messages: [],
      );
}
