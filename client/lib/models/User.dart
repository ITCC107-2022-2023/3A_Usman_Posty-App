class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? userToken;

  User({this.id, this.name, this.email, this.password, this.userToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      password: json['user']['password'],
      userToken: json['user']['userToken'],
    );
  }
}
