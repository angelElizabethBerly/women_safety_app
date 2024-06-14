class UserModel {
  String? id;
  String? name;
  String? phone;
  String? userEmail;
  String? emergEmail;
  String? type;

  UserModel(
      {this.name,
      this.phone,
      this.userEmail,
      this.emergEmail,
      this.id,
      this.type});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'userEmail': userEmail,
        'emergEmail': emergEmail,
        'type': type
      };
}
