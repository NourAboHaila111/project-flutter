
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/shared/network/local/state_controller.dart';

class SshopCubit extends Cubit<SshopState> {

  SshopCubit() : super(SshopInitailHomeState(Locale("en", "")));

  static SshopCubit get(context) => BlocProvider.of(context);


  void toggleLanguage(Locale locale) {
    if (locale.languageCode == "en") {
      emit(SshopInitailHomeState(Locale("ar", "")));
    } else {
      emit(SshopInitailHomeState(Locale("en", "")));
    }
  }
}