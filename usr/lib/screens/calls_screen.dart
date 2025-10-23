import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
        actions: [
          TextButton(
            onPressed: () {
              // Placeholder for starting a new video call
            },
            child: const Text(
              'New Video',
              style: TextStyle(color: Color(0xFF1877F2)),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Text('J')),
            title: Text('John'),
            subtitle: Text('Yesterday'),
          ),
          ListTile(
            leading: CircleAvatar(child: Text('J')),
            title: Text('Jane'),
            subtitle: Text('Yesterday'),
          ),
        ],
      ),
    );
  }
}
