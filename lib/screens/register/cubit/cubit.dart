import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petopia/model/login_model.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/network/remote/dio-helper.dart';
import 'package:petopia/shared/network/remote/end_point.dart';

class PetRegisterCubit extends Cubit<PetRegisterState>
{
  PetRegisterCubit () : super(PetRegisterInitialState());

  static PetRegisterCubit get(context)=>BlocProvider.of(context);

  PetLoginModel? RegisterModel;
  void userRegister({
     String? email,
     String? password,
     String? name,
     String? phone,

  }) {
    emit(PetRegisterLoadingState()); // Emitting a loading state before making the request

    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
    ).then((value) {
      // Handling the response data in a `then` callback
      RegisterModel = PetLoginModel.fromJson(value.data);
      print(RegisterModel!.status);
      print(value.data);
      emit(PetRegisterSuccessState(RegisterModel)); // Emitting a success state after a successful Register
      // if(state is )
      // navigateTo(context,PetLayout());
    }).catchError((error) {
      // Handling any errors in a `catchError` callback
      print(error.toString());
      emit(PetRegisterErrorState(error));
    });
  }
  void vetRegister({
    String? clinicName,
    String? phoneClinic,
    String? openTime,
    String? closeTime,
    double? latitude ,
    double?  longitude ,
    List<String>? availableTimes ,
    List<Map<String, dynamic>>? actions,

  }) {
    emit(PetRegisterLoadingState()); // Emitting a loading state before making the request

    DioHelper.postData(
      url: REGISTER,

      data: {
        'clinicName': clinicName,
        'phoneClinic': phoneClinic,
        'openTime': openTime,
        'CloseTime': closeTime,
        'availableTimes': availableTimes,
      },
    ).then((value) {
      // Handling the response data in a `then` callback
      RegisterModel = PetLoginModel.fromJson(value.data);
      print(RegisterModel!.status);
      print(value.data);
      emit(PetRegisterSuccessState(RegisterModel)); // Emitting a success state after a successful Register
      // if(state is )
      // navigateTo(context,PetLayout());
    }).catchError((error) {
      // Handling any errors in a `catchError` callback
      print(error.toString());
      emit(PetRegisterErrorState(error));
    });
  }
  void MarketRegister({
    String? marketName,
    String? phonemarket,
    String? delivry,
    double? latitude ,
    double?  longitude ,


  }) {
    emit(PetRegisterLoadingState()); // Emitting a loading state before making the request

    DioHelper.postData(
      url: REGISTER,
      data: {
        'clinicName': marketName,
        'phoneClinic': phonemarket,
        'delivry': delivry,

      },
    ).then((value) {
      // Handling the response data in a `then` callback
      RegisterModel = PetLoginModel.fromJson(value.data);
      print(RegisterModel!.status);
      print(value.data);
      emit(PetRegisterSuccessState(RegisterModel)); // Emitting a success state after a successful Register
      // if(state is )
      // navigateTo(context,PetLayout());
    }).catchError((error) {
      // Handling any errors in a `catchError` callback
      print(error.toString());
      emit(PetRegisterErrorState(error));
    });
  }

  IconData? Suffix =Icons.visibility_outlined;
  bool isPassword =true;
  void ChangePassword (){
    isPassword =!isPassword;
   Suffix =isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(PetRegisterChangePasswordVisipilityState());
  }


  TimeOfDay? selectedTime;

  void selectTime(BuildContext context, TextEditingController closeTimeController) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      emit(PetRegisterChangeTimeState());
    }
  }
  void selectTime1(BuildContext context, TextEditingController openTimeController) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      emit(PetRegisterChangeTimeState());
    }
  }

  List<File>? loungeImages;
  void chooseImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

      // ignore: unnecessary_null_comparison
      if (pickedFiles != null) {
        // Convert the list of picked files to a list of File objects
        loungeImages = pickedFiles.map((pickedFile) {
          return File(pickedFile.path);
        }).toList();
      } else {
        print('No images selected.');
      }
    emit(PetRegisterChangeTimeState());


  }
  void deleteImage(int index) {

      loungeImages!.removeAt(index);
      emit(PetRegisterChangeTimeState());
  }
  // void dispose(TextEditingController _timeController) {
  //   _timeController.dispose();
  //   super.dispose();
  // }
  //
  // Future<void> _selectTime(BuildContext context,TextEditingController _timeController) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked != null) {
  //       _timeController.text = picked.format(context);
  //
  //   }
  // }
  String ChangeLang='ar';
  void changeLang (String lang){
    ChangeLang = lang;
    emit(PetRegisterChangeTimeState());

  }
  // ignore: unused_field
  Locale _locale = new Locale('en','US');

  void _changeLanguage(Locale locale){
    _locale = locale;
    emit(PetRegisterChangeTimeState());

  }
  TextEditingController actionNameController = TextEditingController();
  TextEditingController actionCostController = TextEditingController();
  TextEditingController actionDurationController = TextEditingController();
  List<Map<String, dynamic>> actions = [];

  void addAction(Map<String, dynamic> action) {
    actions.add(action);
    emit(PetRegisterChangeTimeState());
  }

  void updateAction(int index, Map<String, dynamic> action) {
    actions[index] = action;
    emit(PetRegisterChangeTimeState());
  }

  void removeAction(int index) {
    actions.removeAt(index);
    emit(PetRegisterChangeTimeState());
  }

  void clearActionFields() {
    actionNameController.clear();
    actionCostController.clear();
    actionDurationController.clear();
  }
  // Add this method to update delivery option
  String? deliveryOption;

  void setDeliveryOption(String option) {
    deliveryOption = option;
    emit(PetRegisterChangeDeliveryOptionState(deliveryOption));
  }


}