import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onOpen;

  const PostCard({super.key, required this.post, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFF1877F2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (post['user']['name'] as String)[0].toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['user']['name'] as String,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    '2h',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(post['text'] as String),
          if (post['media'] != null && (post['media'] as List).isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.network(
                post['media'][0] as String,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () {}, child: const Text('Like')),
              TextButton(onPressed: onOpen, child: const Text('Comment')),
              TextButton(onPressed: () {}, child: const Text('Share')),
            ],
          ),
        ],
      ),
      ),
    );
  }
}