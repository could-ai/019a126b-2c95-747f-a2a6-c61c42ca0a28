import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('U${index + 1}'),
            ),
            title: Text('Chat ${index + 1}'),
            subtitle: const Text('Last message...'),
            onTap: () => Navigator.of(context).pushNamed('/dynamic', arguments: index + 1),
          );
        },
      ),
    );
  }
}