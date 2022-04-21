import 'dart:typed_data';

class User {
  String name = '';
  String email = '';
  String username = '';
  late Uint8List profilepic;
  String token = '';

  User(this.name, this.email, this.token, this.username, this.profilepic);

  // User.fromJson(Map<String, dynamic> json) {
  //   User(
  //     name = json['user']['name'],
  //     email = json['user']['email'],
  //     username = json['user']['username'],
  //     profilepic = Uint8List.fromList(
  //         (json['user']['profilepic']['data'] as List)
  //             .map((e) => e as int)
  //             .toList()),
  //     token = json['token'],
  //   );
  // }
}
