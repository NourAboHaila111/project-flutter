import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/screens/Doctor/viwes/DoctorHome.dart';
import '../data/remot/homeData.dart';
import '../viwes/favourit.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {


  HomeCubit() : super(HomeInitial());

  void initialData() async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate a network call

    final listpage = [const MyHome(), const Favourit(), const Favourit()];
    final listitel = ['Home', 'Settings', 'Favourite'];
    final listIcons = [Icons.home, Icons.settings, Icons.favorite];

    emit(HomeLoaded(
      currentPage: 0,
      listpage: listpage,
      listitel: listitel,
      listIcons: listIcons,
    ));
  }

  void changePage(int index) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(currentPage: index));
    }
  }

  void gotoProductDetails(String image, int Ditemid) {
    // Navigate to product details page
  }

  void gotoItems(List catogry, int selectedcat, int catogryid) {
    // Navigate to items page
  }
}
