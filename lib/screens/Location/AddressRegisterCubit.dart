import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'dart:io';

// Cubit and States
class AddressRegisterCubit extends Cubit<AddressRegisterState> {
  AddressRegisterCubit() : super(AddressRegisterInitialState());

  static AddressRegisterCubit get(BuildContext context) => BlocProvider.of(context);

  AddressModel? addressModel;
  void saveAddress({
    required String streetName,
    required String city,
    required String buildingNumber,
    required String apartmentNumber,
  }) {
    emit(AddressRegisterLoadingState()); // Emitting a loading state before making the request

    DioHelper.postData(
      url: "SAVE_ADDRESS_URL",
      data: {
        'streetName': streetName,
        'city': city,
        'buildingNumber': buildingNumber,
        'apartmentNumber': apartmentNumber,
      },
    ).then((value) {
      // Handling the response data in a `then` callback
      addressModel = AddressModel.fromJson(value.data);
      print(addressModel!.status);
      print(value.data);
      emit(AddressRegisterSuccessState(addressModel)); // Emitting a success state after a successful address save
    }).catchError((error) {
      // Handling any errors in a `catchError` callback
      print(error.toString());
      emit(AddressRegisterErrorState(error.toString()));
    });
  }

  String changeLang = 'ar';
  //String ChangeLang='ar';
  void changeLang2 (String lang){
    changeLang = lang;
    emit(AddressRegisterChangeLangState());

  }
  Locale _locale = Locale('en', 'US');

  void changeLanguage(Locale locale) {
    _locale = locale;
    emit(AddressRegisterChangeLangState());
  }
}

// DioHelper for network requests
class DioHelper {
  static final Dio dio = Dio();

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data);
  }
}

// Address model
class AddressModel {
  final bool status;
  final String message;

  AddressModel({
    required this.status,
    required this.message,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      status: json['status'],
      message: json['message'],
    );
  }
}

// Address register states
abstract class AddressRegisterState {}

class AddressRegisterInitialState extends AddressRegisterState {}

class AddressRegisterLoadingState extends AddressRegisterState {}

class AddressRegisterSuccessState extends AddressRegisterState {
  final AddressModel? addressModel;

  AddressRegisterSuccessState(this.addressModel);
}

class AddressRegisterErrorState extends AddressRegisterState {
  final String error;

  AddressRegisterErrorState(this.error);
}

class AddressRegisterChangeLangState extends AddressRegisterState {}