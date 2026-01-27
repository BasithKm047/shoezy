import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<Set<String>> {
  FavoritesCubit() : super(<String>{});

  void toggleFavorite(String productId) {
    final updated = Set<String>.from(state);
    updated.contains(productId)
        ? updated.remove(productId)
        : updated.add(productId);
    emit(updated);
  }

  bool isFavorite(String productId) => state.contains(productId);
}
