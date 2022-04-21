import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  final String postpic;
  final String location;
  final String caption;
  final String id;
  int likes;
  int dislikes;

  Post({
    required this.postpic,
    required this.location,
    required this.caption,
    required this.id,
    this.likes = 0,
    this.dislikes = 0,
  });
}

class PostList with ChangeNotifier {
  List<Post> _items = [];

  List<Post> get items {
    return [..._items];
  }

  void addPost(Post post) {
    final newpost = Post(
      postpic: post.postpic,
      location: post.location,
      caption: post.caption,
      id: DateTime.now().toString(),
    );
    _items.add(newpost);
    notifyListeners();
  }
}
