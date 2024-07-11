import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petopia/screens/profile/cubit/states.dart';
import 'package:petopia/shared/network/remote/dio-helper.dart';

import '../../../model/register_model.dart';
import '../../../shared/network/remote/end_point.dart';

class ProfileCubit extends Cubit<ProfileState>{

  ProfileCubit ():super(ProfileInitailProfileState());

  static ProfileCubit get(context)=>BlocProvider.of(context);

  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  void selectDate(DateTime? pickedDate){
    selectedDate = pickedDate;
    dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate!);
    emit(ProfileChangeDateState());

  }

  File? images ;
  void pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      var file = File(image.path);
        images = file;
      emit(ProfilePutImageState());
    }
  }

  String? selectedGender;
  void changeGender(String value){
    selectedGender = value;
    emit(ProfileChangeGenderState());
  }


  Register_Model ? register_model;
  void sendData({
    String ? role_id = '2',
    required String ? nameAR,
    required String ? nameEN,
    required String ? email,
    required String ? password,
    required String ? confirm_password,
    File ? image
}) async {
    FormData formData = FormData.fromMap({
      "role_id": role_id,
      "name_ar": nameAR,
      "name_en": nameEN,
      "password": password,
      "password_confirmation": confirm_password,
      "email":email,
      'image': await MultipartFile.fromFile(
        image!.path
      ),
    });
    emit(ProfileLoadingProfileDataState());
    DioHelper.postFormData(
      url: REGISTER,
      data: formData,
    ).then((value) {
      register_model =Register_Model.fromJson(value.data);
      print(value.data);
      emit(ProfileSuccessProfileDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(ProfileErrorProfileDataState());
    });
  }



  IconData? Suffix =Icons.visibility_outlined;
  bool isPassword =true;
  void ChangePassword (){
    isPassword =!isPassword;
    Suffix =isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ProfileChangePasswordVisipilityState());
  }

}