import 'package:bw_home_bridge/backend/cubits/chat/chat_cubit.dart';
import 'package:bw_home_bridge/ui/screens/chat/widgets/message_input.dart';
import 'package:bw_home_bridge/ui/screens/chat/widgets/messages_list.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final String propertyId;

  ChatScreen({required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(propertyId),
      child: Scaffold(
        appBar: AppBar(
          leading: Transform.scale(
            scale: .7,
            child: McIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              McText.h3M(
                'Project ${propertyId}',
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: MessagesList(),
              ),
              MessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}
