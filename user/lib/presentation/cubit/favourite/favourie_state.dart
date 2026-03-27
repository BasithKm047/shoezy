import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  final Set<String> favorites;
  const FavoritesState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoritesInitial extends FavoritesState {
  FavoritesInitial() : super({});
}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded(Set<String> favorites) : super(favorites);
}

class FavoritesLoading extends FavoritesState {
  FavoritesLoading() : super({});
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message) : super({});

  @override
  List<Object?> get props => [message];
}



