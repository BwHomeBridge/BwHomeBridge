import 'package:bw_home_bridge/backend/models/message.dart';

List<Message> mockMessages = [
  Message(
    id: '1',
    content: 'Hello, I am interested in the property.',
    senderId: 'user-1',
    timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    readBy: ['agent-1'],
  ),
  Message(
    id: '2',
    content: 'Hi, sure! What would you like to know?',
    senderId: 'agent-1',
    timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    readBy: ['user-1'],
  ),
  Message(
    id: '3',
    content: 'Can I schedule a visit this weekend?',
    senderId: 'user-1',
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    readBy: [],
  ),
  Message(
    id: '4',
    content: 'Let me get back to you on that',
    senderId: 'agent-1',
    timestamp: DateTime.now().subtract(Duration(minutes: 0)),
    readBy: ['user-1'],
  ),
];
