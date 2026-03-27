import 'package:shoezy/domain/entities/app_location.dart';

abstract class LocationRepository {
  Future<AppLocation> getCurrentLocation();
}