import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart';
import '../../../constant/classes/statuesrequest.dart';
import '../DoctorWidget/ShowProduct.dart';
import '../data/model/productsModel.dart';
import '../data/remot/homeData.dart';
import 'functions/handlingData.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Productsmodel> categories;

  const CategoriesLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class CategoriesError extends CategoriesState {
  final String message;

  const CategoriesError(this.message);

  @override
  List<Object?> get props => [message];
}
final List<Productsmodel> demoCategories = [
  Productsmodel(id: 1, title: 'Category 1', image: 'assets/images/category1.png'),
  Productsmodel(id: 2, title: 'Category 2', image: 'assets/images/category2.png'),
  Productsmodel(id: 3, title: 'Category 3', image: 'assets/images/category3.png'),
  Productsmodel(id: 4, title: 'Category 4', image: 'assets/images/category4.png'),
];
class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeData homeData;

  CategoriesCubit(this.homeData) : super(CategoriesInitial());

  void fetchCategories1() async {
    emit(CategoriesLoading());
    var response = await homeData.showCategories();
    StatuesRequest statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
     // emit(CategoriesLoaded(response.map<Productsmodel>((json) => Productsmodel.fromJson(json)).toList()));
    } else {
      emit(CategoriesError('Failed to fetch categories'));
    }
  }
  void fetchCategories() {
    emit(CategoriesLoading());
    // استخدم البيانات التجريبية هنا
    emit(CategoriesLoaded(categories: demoCategories));
  }


}
