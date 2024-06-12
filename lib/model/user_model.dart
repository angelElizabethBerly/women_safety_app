class UserModel {
  String? id;
  String? name;
  String? phone;
  String? userEmail;
  String? guardianEmail;
  UserModel(
      {this.name, this.phone, this.userEmail, this.guardianEmail, this.id});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'userEmail': userEmail,
        'guardianEmail': guardianEmail
      };
}
