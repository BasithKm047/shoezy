import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/domain/entities/app_location.dart';
part 'location_satate.freezed.dart';
@freezed 
class LocationSatate with _$LocationSatate {
  const factory LocationSatate.initial() = _Initial;
  const factory LocationSatate.loading() = _Loading;
  const factory LocationSatate.loaded(AppLocation location) = _Loaded;
  const factory LocationSatate.error(String message) = _Error;
  
}