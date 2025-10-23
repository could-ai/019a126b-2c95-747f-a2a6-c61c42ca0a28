import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:math';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  bool _inCall = false;
  WebViewController? _webViewController;

  void _startVideoCall() {
    final random = Random();
    final room = 'snaygram_room_${random.nextInt(100000)}';
    final url = 'https://meet.jit.si/$room#config.prejoinPageEnabled=false';

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    setState(() {
      _inCall = true;
      _webViewController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_inCall && _webViewController != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('In Call'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                _inCall = false;
                _webViewController = null;
              });
            },
          ),
        ),
        body: WebViewWidget(controller: _webViewController!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
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
