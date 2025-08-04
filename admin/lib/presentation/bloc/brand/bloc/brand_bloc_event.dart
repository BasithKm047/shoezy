part of 'brand_bloc_bloc.dart';

@immutable
sealed class BrandBlocEvent {}

class PicImageEvent extends BrandBlocEvent {
  final Uint8List? imagePath;

  PicImageEvent(this.imagePath);
}

class SubmitFormEvent extends BrandBlocEvent{
  final String brandName;
  final  Uint8List logo;

  SubmitFormEvent({required this.brandName,required this.logo});
}
