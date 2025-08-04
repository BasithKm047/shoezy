class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String phoneNumber;
  final String imagePath;

  UserModel({
    this.id,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? phoneNumber,
    String? imagePath,
    String ? id,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
      id:  id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imagePath': imagePath,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString(){
    return 'UserModel(id:$id userName: $userName, phoneNumber: $phoneNumber, email: $email, imagePath: $imagePath, )';
  }
}
