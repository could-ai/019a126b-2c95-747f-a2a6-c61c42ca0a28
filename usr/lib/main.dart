import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/splash_screen.dart';
import 'package:couldai_user_app/screens/login_screen.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/calls_screen.dart';
import 'package:couldai_user_app/screens/chat_list_screen.dart';
import 'package:couldai_user_app/screens/profile_screen.dart';
import 'package:couldai_user_app/screens/camera_screen.dart';
import 'package:couldai_user_app/screens/dynamic_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snaygram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/calls': (context) => const CallsScreen(),
        '/chat': (context) => const ChatListScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/camera': (context) => const CameraScreen(),
        '/dynamic': (context) => const DynamicScreen(),
      },
    );
  }
}
