class User {
  String id;
  String username;
  String imageUrl;
  String password;
  String role;

  //Construtor
  User(
      {this.id = "",
      this.username = "",
      this.password = "",
      this.imageUrl = "",
      this.role = ""});
}
