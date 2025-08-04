part of 'admin_profile_bloc.dart';

@immutable
sealed class AdminProfileState {}

final class AdminProfileInitial extends AdminProfileState {}

class AdminProfileImagePickedState extends AdminProfileState{
  final Uint8List  image;

  AdminProfileImagePickedState(this.image);
}

class AdminProfileUpdateError extends AdminProfileState{}

class AdminProfileUpdateSuccess  extends AdminProfileState{}

class AdminProfileUpdateFailed extends AdminProfileState{
  final String error ;
  AdminProfileUpdateFailed(this.error);
}

class AdminProfileSubmitting extends AdminProfileState{}

