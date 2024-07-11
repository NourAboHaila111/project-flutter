import 'package:bloc/bloc.dart';
import 'package:petopia/model/filtter_model.dart';
import 'package:petopia/screens/fillter/cubit/states.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial(FilterModel()));

  void updateFilter(String key, dynamic value) {
    final currentFilter = state.filter;

    final updatedFilter = currentFilter.copyWith(
      animal: key == 'animal' ? value : null,
      breed: key == 'breed' ? value : null,
      priceRange: key == 'priceRange' ? value : null,
      gender: key == 'gender' ? value : null,
      hypoallergenic: key == 'hypoallergenic' ? value : null,
      woolLength: key == 'woolLength' ? value : null,
      pedigree: key == 'pedigree' ? value : null,
      vaccinations: key == 'vaccinations' ? value : null,
      size: key == 'size' ? value : null,
      age: key == 'age' ? value : null,
    );
    emit(FilterUpdated(updatedFilter));
  }

  void toggleCharacter(String character) {
    final currentFilter = state.filter;

    final currentList = List<String>.from(currentFilter.character);
    if (currentList.contains(character)) {
      currentList.remove(character);
    } else {
      currentList.add(character);
    }
    emit(FilterUpdated(currentFilter.copyWith(character: currentList)));
  }
}
