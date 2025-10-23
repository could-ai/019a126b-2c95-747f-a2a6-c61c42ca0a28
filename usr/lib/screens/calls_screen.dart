import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  bool inCall = false;
  String? roomUrl;
  final List<Map<String, String>> contacts = [
    {'id': 'u2', 'name': 'John'},
    {'id': 'u3', 'name': 'Jane'},
  ];

  void _startVideoCall() {
    final room = 'snaygram_room_${DateTime.now().millisecondsSinceEpoch}';
    setState(() {
      roomUrl = 'https://meet.jit.si/$room#config.prejoinPageEnabled=false';
      inCall = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (inCall && roomUrl != null) {
      return Scaffold(
        body: WebView(
          initialUrl: roomUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calls', style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          TextButton(
            onPressed: _startVideoCall,
            child: const Text(
              'New Video',
              style: TextStyle(color: Color(0xFF1877F2)),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact['name']!, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Yesterday', style: TextStyle(color: Color(0xFF666666))),
          );
        },
      ),
    );
  }
}