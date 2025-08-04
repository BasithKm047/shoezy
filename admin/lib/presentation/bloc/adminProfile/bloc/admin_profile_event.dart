part of 'admin_profile_bloc.dart';

@immutable
sealed class AdminProfileEvent {}

class AdminProfileImagePick extends AdminProfileEvent{
  // final Uint8List image;

  // AdminProfileImagePick(this.image);

}

class AdminProfileUpdateevent extends AdminProfileEvent{
  
}

