part of 'brand_bloc_bloc.dart';

@immutable
sealed class BrandBlocState {}

final class BrandBlocInitial extends BrandBlocState {}

class ImagePickedState extends BrandBlocState {
  final Uint8List imagePath;

  ImagePickedState(this.imagePath);
}

class BrandFormSuccess extends BrandBlocState {}

class BrandFormFailure extends BrandBlocState {
  final String error;

  BrandFormFailure(this.error);
}

class BrandFormSubmitting extends BrandBlocState {}


