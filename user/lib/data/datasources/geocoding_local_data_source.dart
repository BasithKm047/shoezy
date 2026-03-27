import 'package:geocoding/geocoding.dart';

class GeocodingLocalDataSource {
  Future<String> getAddressFromLating(double latitude, double longitude) async {
    final placemark = await placemarkFromCoordinates(latitude, longitude);

    final place = placemark.first;

    return "${place.street}, "
        "${place.locality}, "
        "${place.administrativeArea}, "
        "${place.country}, "
        "${place.postalCode}";
  }
}
