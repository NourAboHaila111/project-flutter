import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/layout/cubit/states.dart';

class PetopiaCubit extends Cubit<PetopiaState>{

  PetopiaCubit() : super(PetopiaInitailHomeState());

  static PetopiaCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  void changeBottom (index)
  {
    currentIndex=index;
    emit(PetopiaChangeBottomNavState());
  }
}