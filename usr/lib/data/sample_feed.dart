import 'package:couldai_user_app/models/post_model.dart';

final List<Post> sampleFeed = [
  Post(
    id: 'p1',
    user: User(name: 'Maya'),
    text: 'Morning at the lake!',
    media: ['https://picsum.photos/600/400?random=1'],
  ),
  Post(
    id: 'p2',
    user: User(name: 'John'),
    text: 'Snaygram prototype demo',
    media: ['https://picsum.photos/600/400?random=2'],
  ),
];
