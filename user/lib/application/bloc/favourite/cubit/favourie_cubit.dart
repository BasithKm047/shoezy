import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/data/repositories/favourite_repository.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository repository;

  FavoritesCubit({required this.repository}) : super(FavoritesLoading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final favorites = await repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    if (state is FavoritesLoaded) {
      final currentFavorites = List<ProductModel>.from(
        (state as FavoritesLoaded).favorites,
      );

      final isFav = currentFavorites.any((p) => p.id == product.id);

      if (isFav) {
        await repository.removeFavorite(product.id!);
        currentFavorites.removeWhere((p) => p.id == product.id);
      } else {
        await repository.addFavorite(product);
        currentFavorites.add(product);
      }

      emit(FavoritesLoaded(currentFavorites));
    }
  }

  bool isFavorite(ProductModel product) {
    if (state is FavoritesLoaded) {
      final currentFavorites = (state as FavoritesLoaded).favorites;
      return currentFavorites.any((p) => p.id == product.id);
    }
    return false;
  }
}
