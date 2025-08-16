part of 'brand_bloc.dart';

@immutable
sealed class BrandState {}

final class BrandInitial extends BrandState {}

final class BrandLoadingState extends BrandState{}
final class BrandLoadedState extends BrandState{
  final List<BrandModel>brands;
  BrandLoadedState(this.brands);
}


final class BrandLoadErrorState extends BrandState{
  final String message;
  BrandLoadErrorState(this.message);
}