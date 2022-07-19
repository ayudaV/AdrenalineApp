class User {
  String id;
  String username;
  String firstName;
  String lastName;
  String email;
  String birthday;
  String imageUrl;
  String role;
  String token;

  //Construtor
  User({
    this.id = "",
    this.username = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.birthday = "",
    this.imageUrl = "Images/Users/1658184416429_face.png",
    this.role = "",
    this.token = "",
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      birthday: json['birthday'],
      imageUrl: json['image'],
      role: json['role'],
      token: json['token'],
    );
  }
}
