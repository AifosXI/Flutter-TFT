class User {
  int id;
  String email;
  String username;
  User ({
    required this.email,
    required this.username,
    required this.id,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int,
      username = json['username'],
      email = json['email'];
}