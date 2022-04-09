import 'package:clubz/widgets/bottom_navigation_bar.dart';

import '../widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [PostCard(), PostCard(), PostCard()],
        ),
      ),
    );
  }
}
