import 'package:bw_home_bridge/backend/mock_data/chats_mock.dart';
import 'package:bw_home_bridge/backend/models/message.dart';
import 'package:dio/dio.dart';

class ChatRepository {
  final Dio _dio = Dio();

  ChatRepository();

  Future<List<Message>> fetchMessages(String propertyId) async {
    await Future.delayed(Duration(seconds: 1));
    return mockMessages;

    final response = await _dio.get('/properties/$propertyId/messages');
    return (response.data as List)
        .map((json) => Message.fromJson(json))
        .toList();
  }

  Future<void> sendMessage(String propertyId, Message message) async {
    await _dio.post('/properties/$propertyId/messages', data: message.toJson());
  }
}
