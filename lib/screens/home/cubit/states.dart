import 'package:petopia/model/home_model.dart';

abstract class PetCubitState {}

class PetCubitInitial extends PetCubitState {}

class PetCubitLoaded extends PetCubitState {
  final List<Pet> pets;

  PetCubitLoaded({required this.pets});
}
