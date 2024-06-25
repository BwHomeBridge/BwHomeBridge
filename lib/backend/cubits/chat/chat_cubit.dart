import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bw_home_bridge/backend/models/message.dart';
import 'package:bw_home_bridge/backend/repositories/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository = ChatRepository();
  final String _propertyId;
  Timer? _timer;

  ChatCubit(this._propertyId) : super(ChatState.initial()) {
    _fetchMessages();
    _startPolling();
  }

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) => _fetchMessages());
  }

  Future<void> _fetchMessages() async {
    emit(state.copyWith(isLoading: false));
    final messages = await _chatRepository.fetchMessages(_propertyId);
    emit(state.copyWith(isLoading: false, messages: messages));
  }

  Future<void> sendMessage(Message message) async {
    await _chatRepository.sendMessage(_propertyId, message);
    _fetchMessages();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
