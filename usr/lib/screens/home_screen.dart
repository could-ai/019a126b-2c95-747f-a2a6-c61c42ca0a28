import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_card.dart';
import '../data/sample_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> feed = sampleFeed;

  @override
  void initState() {
    super.initState();
    _loadFeed();
  }

  Future<void> _loadFeed() async {
    try {
      final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=2&limit=10'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        setState(() {
          feed = data.map((item) {
            return {
              'id': 'p_${item['id']}',
              'user': {'name': item['author']},
              'text': 'Shared a photo',
              'media': [item['download_url']],
            };
          }).toList();
        });
      }
    } catch (e) {
      // Fallback to sample feed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Snaygram',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Text('💬'),
            onPressed: () => Navigator.of(context).pushNamed('/chatlist'),
          ),
          IconButton(
            icon: const Text('📞'),
            onPressed: () => Navigator.of(context).pushNamed('/calls'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feed.length,
        itemBuilder: (context, index) {
          return PostCard(
            post: feed[index],
            onOpen: () => Navigator.of(context).pushNamed('/dynamic', arguments: 1),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/camera'),
        backgroundColor: const Color(0xFF1877F2),
        child: const Text(
          '+',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}