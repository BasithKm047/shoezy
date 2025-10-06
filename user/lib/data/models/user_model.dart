class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String phoneNumber;
  final String imagePath;
  final bool isAdmin;
  final bool? isBlocked;

  UserModel({
    this.id,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    this.isAdmin = false,
    required this.imagePath,
    this.isBlocked = false,
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
      isAdmin: isAdmin,
      isBlocked: isBlocked ?? isBlocked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imagePath': imagePath,
      'isAdmin': isAdmin,
      'isBlocked': isBlocked,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      imagePath: map['imagePath'],
      isAdmin: map['isAdmin'] ?? false,
      isBlocked: map['isBlocked'] ?? false,
    );
  }

  @override
  String toString(){
    return 'UserModel(id:$id userName: $userName, phoneNumber: $phoneNumber, email: $email, imagePath: $imagePath, isAdmin: $isAdmin, isBlocked: $isBlocked)';
  }
}
