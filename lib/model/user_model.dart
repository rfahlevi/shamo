class UserModel {
  // Buat parameter sesuai dengan postman
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;

  // Buat Constructor dari parameter diatas
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.profilePhotoUrl,
      this.token});

  // Buat constuctor untuk mengubah constuctor diatas ke dalam JSON
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  // Function utk mengubah constructor diatas kedalam bentuk JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }

  // Tambahkan package Provider & Http
}
