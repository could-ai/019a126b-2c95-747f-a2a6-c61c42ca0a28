import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Text('U')),
            title: const Text('User 1'),
            subtitle: const Text('Hello!'),
            onTap: () => Navigator.of(context).pushNamed('/dynamic', arguments: {'screenId': 2}),
          ),
        ],
      ),
    );
  }
}
