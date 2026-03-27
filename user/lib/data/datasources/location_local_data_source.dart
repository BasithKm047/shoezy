import 'package:geolocator/geolocator.dart';

abstract class LocationLocalDataSource {
  Future<Position> getCurrentPosition();
}

class LocationLocalDataSourceImpl
    implements LocationLocalDataSource {

  @override
  Future<Position> getCurrentPosition() async {

    bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location service disabled");
    }

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      throw Exception("Permission denied forever");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}