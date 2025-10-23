import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _index = 0;
  final List<Map<String, String>> _screens = [
    {'title': 'Snaygram', 'subtitle': 'Connect. Share. Stream.'},
    {'title': 'Chats & Calls', 'subtitle': 'High quality audio & video'},
    {'title': 'Reels & Live', 'subtitle': 'Create and broadcast'},
    {'title': 'Privacy First', 'subtitle': 'You own your data'}
  ];

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_index < _screens.length - 1) {
        setState(() {
          _index++;
        });
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1877F2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    fontSize: 56,
                    color: Color(0xFF1877F2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _screens[_index]['title']!,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _screens[_index]['subtitle']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
