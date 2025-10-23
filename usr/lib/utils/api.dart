import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:couldai_user_app/models/post_model.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=2&limit=10'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((p) {
      return Post(
        id: 'p_${p['id']}',
        user: User(name: p['author']),
        text: 'Shared a photo',
        media: [p['download_url']],
      );
    }).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
