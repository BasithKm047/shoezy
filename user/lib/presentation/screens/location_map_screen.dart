import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoezy/presentation/cubit/location/Location_cubit.dart';
import 'package:shoezy/presentation/cubit/location/location_satate.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().fetchCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Select Location",
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
         fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      
      )),
      body: BlocBuilder<LocationCubit,LocationSatate>(builder: (context,state){
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (location){
            return Stack(
              children: [
               GoogleMap(
                initialCameraPosition: CameraPosition(target: 
                LatLng(location.latitude, location.longitude), zoom: 16),
                myLocationButtonEnabled: true,
               ),
               
                  Positioned(
                    bottom: 30,
                    left: 80,
                    right: 80,
                    child: CostumWidget.costumElevatedButton(
                      width: 200.0,
                      context: context,
                      title: 'Confirm Location',
                      fontSize: 16,
                      backgroundColor: Colors.blue,
                      ontap: () {
                        Navigator.pop(context, location);
                      },
                      child: const Text("Confirm Location"),
                    ),
                  ),
              ],
            );
          },
          error: (message) => Center(child: Text("Error: $message")),
          orElse: () => const SizedBox(),
        );
      }),
    );
  }
}