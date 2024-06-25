import 'package:bw_home_bridge/backend/cubits/chat/chat_cubit.dart';
import 'package:bw_home_bridge/backend/models/message.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/datetime_extentions.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final messages = state.messages.reversed.toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageBubble(message: message);
            },
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  });

  final Message message;

  bool get _isFromCurrentUser {
    return message.senderId == 'agent-1';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 25,
      // ),
      child: Column(
        crossAxisAlignment: _isFromCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: _isFromCurrentUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: _isFromCurrentUser
                      ? McColors.secondary.withOpacity(.8)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: McText.body(message.content),
              ),
            ],
          ),
          McText(
            message.timestamp.toHourMinutes(),
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
