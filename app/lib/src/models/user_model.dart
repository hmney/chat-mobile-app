class UserModel {
  String uid;
  String username;
  String email;
  String password;
  String profilePicture;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'password': password,
        'profilePicture': profilePicture,
      };
}
