import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/splash_set.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/calls_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/dynamic_screen.dart';
import 'components/post_card.dart';
import 'data/sample_feed.dart';
import 'data/screen_definitions.dart';

void main() {
  runApp(const SnaygramApp());
}

class SnaygramApp extends StatelessWidget {
  const SnaygramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snaygram Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1877F2),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashSet(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/calls': (context) => const CallsScreen(),
        '/chatlist': (context) => const ChatListScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/camera': (context) => const CameraScreen(),
        '/dynamic': (context) => const DynamicScreen(),
      },
    );
  }
}