import 'package:bloc/bloc.dart';
import 'package:petopia/model/home_model.dart';
import 'package:petopia/screens/home/cubit/states.dart';

class PetCubit extends Cubit<PetCubitState> {
  PetCubit() : super(PetCubitInitial());
  List<Pet> pets = [
    Pet(name: 'Max', breed: 'Corgie', age: '8 month', price: 580, location: 'Warsaw', imageUrl: 'path_to_image',gender: true),
    Pet(name: 'Bailey', breed: 'Pug', age: '1 year', price: 200, location: 'Krakow', imageUrl: 'path_to_image',gender: false),
    // Add more pets as needed
  ];
  void loadPets() {
    // Simulate loading data

    emit(PetCubitLoaded(pets: pets));
  }


  void toggleFavorite(Pet pet) {
    pet.isFavorited = !pet.isFavorited;
    emit(PetCubitLoaded(pets: List.from(pets)));
  }
}