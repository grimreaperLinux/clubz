import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
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
                subtitle: Text('Ze user location'),
                trailing: IconButton(
                  iconSize: 35.0,
                  icon: Icon(Icons.bookmark_add_outlined),
                  onPressed: null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ClipRRect(
                child: Image.network(
                    'https://media.istockphoto.com/photos/business-man-pushing-large-stone-up-to-hill-business-heavy-tasks-and-picture-id825383494?k=20&m=825383494&s=612x612&w=0&h=tEqZ5HFZcM3lmDm_cmI7hOeceiqy9gYrkyLTTkrXdY4='),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
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
                  Text('Some shitty Caption'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
