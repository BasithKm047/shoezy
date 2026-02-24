import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/domain/repositories/location_repository.dart';
import 'package:shoezy/presentation/cubit/location/location_satate.dart';

class LocationCubit extends Cubit<LocationSatate> {
  final LocationRepository repository;  
  LocationCubit({required this.repository}) : super(const LocationSatate.initial());

  Future<void> fetchCurrentLocation() async {

    emit(const LocationSatate.loading());

    try {
      final location =
          await repository.getCurrentLocation();

      emit(LocationSatate.loaded(location));
    } catch (e) {
      emit(LocationSatate.error(e.toString()));
    }
  }

}