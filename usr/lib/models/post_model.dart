class Post {
  final String id;
  final User user;
  final String text;
  final List<String> media;

  Post({
    required this.id,
    required this.user,
    required this.text,
    required this.media,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      user: User.fromJson(json['user']),
      text: json['text'],
      media: List<String>.from(json['media']),
    );
  }
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}
