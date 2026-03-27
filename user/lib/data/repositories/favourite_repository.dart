import 'package:hive/hive.dart';

class FavouriteRepository {
  static const String boxName = "favourites";
  Future<Box<List<String>>> openBoxFunction() async {
    return await Hive.openBox<List<String>>(boxName);
  }

 
  Future<Set<String>> loadFavourites() async {
    final box = await openBoxFunction();
    final ids = box.get('ids', defaultValue: <String>[])!;
    // Logger().w('Loaded favourite IDs: $ids');
    return ids.toSet();
  }

  Future<void> saveFavourites(Set<String> favouriteIds) async {
    final box = await openBoxFunction();
    await box.put('ids', favouriteIds.toList());
    // Logger().w('Saved favourite IDs: ${favouriteIds.toList()}');
  }
 Future<void> clearFavourites() async {
    final box = await openBoxFunction();
    await box.delete('ids');
    // Logger().w('Cleared all favourite IDs');
  }
 
}
