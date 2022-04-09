class User {
  String name = '';
  String email = '';
  String username = '';
  var profilepic;
  String token = '';

  User(this.name, this.email, this.token, this.username, this.profilepic);

  User.fromJson(Map<String, dynamic> json) {
    User(
      name = json['user']['name'],
      email = json['user']['email'],
      username = json['user']['username'],
      profilepic = json['user']['profilepic']['data'],
      token = json['token'],
    );
  }
}
