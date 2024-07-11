// map_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

// Define the states
abstract class MapState {}

class MapInitialState extends MapState {}

class MapLocationSelectedState extends MapState {
  final LatLng selectedLocation;
  MapLocationSelectedState(this.selectedLocation);
}

// Define the Cubit
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitialState());

  void selectLocation(LatLng location) {
    emit(MapLocationSelectedState(location));
  }
}
