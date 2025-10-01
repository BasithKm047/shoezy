part of 'user_bloc.dart';

@freezed
sealed class UserEvent with _$UserEvent {
  const factory UserEvent.addUser(Usermodel user) = AddUser;
  const factory UserEvent.updateUser(Usermodel user) = UpdateUser;
  const factory UserEvent.deleteUser(String id) = DeleteUser;
  const factory UserEvent.fetchUsers() = FetchUsers;
  const factory UserEvent.searchUsers(String query) = SearchUsers;
}
