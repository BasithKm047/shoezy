import 'package:shoezy/data/datasources/location_local_data_source.dart';
import 'package:shoezy/domain/entities/app_location.dart';
import 'package:shoezy/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource localDataSource;
  LocationRepositoryImpl({required this.localDataSource});
  @override
  Future<AppLocation> getCurrentLocation() async {
    final position = await localDataSource.getCurrentPosition();
    return AppLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}