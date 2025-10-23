import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/post_card.dart';
import 'package:couldai_user_app/models/post_model.dart';
import 'package:couldai_user_app/data/sample_feed.dart';
import 'package:couldai_user_app/utils/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> _feed = sampleFeed;

  @override
  void initState() {
    super.initState();
    _fetchFeed();
  }

  Future<void> _fetchFeed() async {
    try {
      final posts = await fetchPosts();
      setState(() {
        _feed = posts;
      });
    } catch (e) {
      // If API fails, the sample feed is already set
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text(
          'Snaygram',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () => Navigator.of(context).pushNamed('/chat'),
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined),
            onPressed: () => Navigator.of(context).pushNamed('/calls'),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: _feed.length,
        itemBuilder: (context, index) {
          return PostCard(
            post: _feed[index],
            onOpen: () => Navigator.of(context).pushNamed('/dynamic', arguments: {'screenId': 1}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/camera'),
        backgroundColor: const Color(0xFF1877F2),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
