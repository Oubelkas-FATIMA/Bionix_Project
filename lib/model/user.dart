class User {
  String username;
  String password;
  String email;

  User(
    this.username,
    this.password,
    this.email,
  );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };
}
