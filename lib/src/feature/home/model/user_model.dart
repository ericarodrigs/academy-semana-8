class UserModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String status;

  UserModel({this.id, this.name, this.email, this.gender, this.status = 'active'});

  Map<String, dynamic> toJson() => {
    'id': id,
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
