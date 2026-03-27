// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/user/userModel.dart';
import 'package:shoezy_admin/data/repositories/user_services.dart';

part 'user_event.dart';
part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserServices userServices;
  UserBloc(this.userServices) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userServices.fetchUsers();
        emit(UserLoaded(users));
        // Logger().d('Users fetched successfully');
      } catch (e) {
        // Logger().e('Error fetching users: $e');
        emit(UserError(e.toString()));

      }
    });
    on<SearchUsers>((event, emit) async {
      try {
        final users = await userServices.searchUsers(event.query);
        emit(UserLoaded(users));
        // Logger().d('Users searched successfully');
      } catch (e) {
        // Logger().e('Error searching users: $e');
        emit(UserError(e.toString()));
      }
    });
    on<BlockUnblockUser>((event, emit) async {
      try {
        await userServices.updateUserBlocked(event.user);
        // Logger().d('User block/unblock status updated successfully');
        final users = await userServices.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        // Logger().e('Error updating user block/unblock status: $e');
        emit(UserError(e.toString()));
      }
    });
    on<DeleteUser>((event, emit) async {
      try {
        await userServices.deleteUser(event.id);
        // Logger().d('User deleted successfully');
        final users = await userServices.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        // Logger().e('Error deleting user: $e');
        emit(UserError(e.toString()));
      }
    });
  }
}
