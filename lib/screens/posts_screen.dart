import 'package:clubz/models/post.dart';

import '../widgets/post_card.dart';
import 'package:flutter/material.dart';
import '../widgets/alertdialogforzeform.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  static const routename = '/posts';

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var _isinit = true;

  @override
  void didChangeDependencies() {
    var posts = Provider.of<PostList>(context);
    if (_isinit && posts.items.isEmpty) {
      Provider.of<PostList>(context).getposts();
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostList>(context);
    double heightofscreen = MediaQuery.of(context).size.height;
    double widthofscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertForZeForm();
            },
          );
        },
        elevation: 7.0,
        highlightElevation: 4.0,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
            posts.items.isEmpty
                ? const Center(
                    child: Text(
                      'No more posts',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Column(
                    children: [
                      ...posts.items.map(
                        (item) => ChangeNotifierProvider.value(
                          value: item,
                          child: PostCard(),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
