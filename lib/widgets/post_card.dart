import 'package:clubz/models/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        elevation: 8.0,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80'),
                  radius: 20,
                ),
                title: Text('A User'),
                subtitle: Text(post.location),
                trailing: IconButton(
                  iconSize: 35.0,
                  icon: Icon(Icons.bookmark_add_outlined),
                  onPressed: null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                height: 400,
                child: ClipRRect(
                  child: Image.network(
                    post.postpic,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_outlined),
                  onPressed: null,
                  iconSize: 30.0,
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                  onPressed: null,
                  iconSize: 30.0,
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Row(
                children: [
                  Text(
                    'A User',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(post.caption),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
