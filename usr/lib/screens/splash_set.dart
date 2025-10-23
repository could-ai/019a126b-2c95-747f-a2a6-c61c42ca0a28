import 'package:flutter/material.dart';
import 'dart:async';

class SplashSet extends StatefulWidget {
  const SplashSet({super.key});

  @override
  State<SplashSet> createState() => _SplashSetState();
}

class _SplashSetState extends State<SplashSet> {
  final List<Map<String, String>> screens = [
    {'title': 'Snaygram', 'subtitle': 'Connect. Share. Stream.'},
    {'title': 'Chats & Calls', 'subtitle': 'High quality audio & video'},
    {'title': 'Reels & Live', 'subtitle': 'Create and broadcast'},
    {'title': 'Privacy First', 'subtitle': 'You own your data'}
  ];

  int index = 0;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    setState(() {
      opacity = 1.0;
    });
    Timer(const Duration(seconds: 1, milliseconds: 200), () {
      setState(() {
        opacity = 0.0;
      });
      Timer(const Duration(milliseconds: 300), () {
        if (index < screens.length - 1) {
          setState(() {
            index++;
          });
          _startAnimation();
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = screens[index];
    return Scaffold(
      backgroundColor: const Color(0xFF1877F2),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 600),
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                screen['title']!,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                screen['subtitle']!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}