import '../widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  static const routename = '/posts';

  @override
  Widget build(BuildContext context) {
    double heightofscreen = MediaQuery.of(context).size.height;
    double widthofscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  widthofscreen * 0.05,
                  heightofscreen * 0.15,
                  widthofscreen * 0.4,
                  heightofscreen * 0.02),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Explore',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
          ],
        ),
      ),
    );
  }
}
