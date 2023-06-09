class UserModel {
  int? id;
  String name;
  String email;
  String gender;
  String status;

  UserModel({this.id, required this.name, required this.email, required this.gender, this.status = 'active'});

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'gender': gender,
    'status': status,
  };

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        gender = json['gender'],
        status = json['status'];

  @override
  String toString() {
    return '{ $id, $name, $email, $gender, $status }';
  }
}
