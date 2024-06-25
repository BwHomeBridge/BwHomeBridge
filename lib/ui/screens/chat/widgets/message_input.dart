import 'package:bw_home_bridge/backend/cubits/chat/chat_cubit.dart';
import 'package:bw_home_bridge/backend/models/message.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing).copyWith(bottom: 40),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Type a message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final content = _controller.text;
              if (content.isNotEmpty) {
                final message = Message(
                  id: DateTime.now().toIso8601String(),
                  content: content,
                  senderId: 'user-id', // Replace with actual user ID
                  timestamp: DateTime.now(),
                  readBy: [],
                );
                context.read<ChatCubit>().sendMessage(message);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
