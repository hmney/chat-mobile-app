class UserModel {
  String uid;
  String username;
  String email;
  String profilePicture;

  UserModel({
    this.uid,
    this.username,
    this.email,
    
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'profile_picture': profilePicture,
      };
}
