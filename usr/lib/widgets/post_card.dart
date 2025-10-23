import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onOpen;

  const PostCard({super.key, required this.post, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF1877F2),
                  child: Text(
                    post.user.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('2h', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(post.text),
            if (post.media.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(post.media[0]),
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
