import 'package:bloc/bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/data/repositories/favourite_repository.dart';

class FavoritesCubit extends Cubit<Set<String>> {
  final FavouriteRepository repository;

  FavoritesCubit(this.repository) : super(<String>{}) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await repository.loadFavourites();
    emit(favorites);
  }

  Future<void> toggleFavorite(String productId) async {
    final updated = Set<String>.from(state);

    if (updated.contains(productId)) {
      updated.remove(productId);
    } else {
      updated.add(productId);
    }

    emit(updated);
    await repository.saveFavourites(updated);
  }

Future<void> syncWithProducts(List<ProductModel> products) async {
  if (products.isEmpty) return; // 🔒 CRITICAL GUARD

  final productIds = products
      .map((e) => e.id)
      .whereType<String>()
      .toSet();

  final updated = state.intersection(productIds);

  if (updated.length != state.length) {
    emit(updated);
    await repository.saveFavourites(updated);
  }
}

  bool isFavorite(String productId) => state.contains(productId);
}
