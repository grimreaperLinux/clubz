import 'package:clubz/models/post.dart';
import 'package:clubz/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './alertdialogforzeform.dart';

class PostCard extends StatelessWidget {
  bool _forEdit = true;

  void selectedItem(item, Post post, BuildContext context) async {
    switch (item) {
      case 0:
        print('Save initiated');
        break;
      case 1:
        {
          void openForm() {
            showDialog(
              context: context,
              builder: (BuildContext context) => ChangeNotifierProvider.value(
                value: post,
                child: AlertForZeForm(_forEdit),
              ),
            );
          }

          openForm();
        }
        break;
      case 2:
        {
          final token = await UserList().getzepresentuser();
          await Provider.of<PostList>(context, listen: false)
              .deleteProduct(post.id, token['token'] as String);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    final users = Provider.of<UserList>(context, listen: false);
    final user =
        users.items.firstWhere(((element) => element.id == post.owner));
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                title: Text(user.username),
                subtitle: Text(post.location),
                trailing: FutureBuilder(
                  future: users.getzepresentuser(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return PopupMenuButton(
                        itemBuilder: ((context) => [
                              const PopupMenuItem(
                                child: Text('Save'),
                                value: 1,
                              ),
                            ]),
                        onSelected: (item) {
                          selectedItem(item, post, context);
                        },
                      );
                    } else {
                      final loggeduser = snapshot.data as Map;
                      return loggeduser['id'] == post.owner
                          ? PopupMenuButton(
                              itemBuilder: ((context) => [
                                    const PopupMenuItem(
                                      child: Text('Edit'),
                                      value: 1,
                                    ),
                                    const PopupMenuItem(
                                      child: Text('Delete'),
                                      value: 2,
                                    ),
                                  ]),
                              onSelected: (item) {
                                selectedItem(item, post, context);
                              },
                            )
                          : PopupMenuButton(
                              itemBuilder: ((context) => [
                                    const PopupMenuItem(
                                      child: Text('Save'),
                                      value: 1,
                                    ),
                                  ]),
                              onSelected: (item) {
                                selectedItem(item, post, context);
                              },
                            );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                height: 300,
                child: ClipRRect(
                  child: Image.network(
                    post.postpic,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(children: [
                IconButton(
                  icon: post.isliked
                      ? const Icon(Icons.favorite_outlined)
                      : const Icon(Icons.favorite_border_outlined),
                  onPressed: () async {
                    final token = await users.getzepresentuser();
                    post.liked(token['token'] as String);
                  },
                  iconSize: 30.0,
                ),
              ]),
            ),
            post.noOfLikes == 0
                ? const SizedBox(
                    height: 0,
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                    child: Row(
                      children: [
                        Text(
                          post.noOfLikes.toString(),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        post.noOfLikes == 1
                            ? const Text('Like')
                            : const Text('Likes')
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Row(
                children: [
                  Text(
                    user.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
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
