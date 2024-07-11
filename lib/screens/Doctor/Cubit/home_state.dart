import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final int currentPage;
  final List<dynamic> listpage;
  final List<String> listitel;
  final List<IconData> listIcons;

  const HomeLoaded({
    required this.currentPage,
    required this.listpage,
    required this.listitel,
    required this.listIcons,
  });

  HomeLoaded copyWith({
    int? currentPage,
    List<dynamic>? listpage,
    List<String>? listitel,
    List<IconData>? listIcons,
  }) {
    return HomeLoaded(
      currentPage: currentPage ?? this.currentPage,
      listpage: listpage ?? this.listpage,
      listitel: listitel ?? this.listitel,
      listIcons: listIcons ?? this.listIcons,
    );
  }

  @override
  List<Object?> get props => [currentPage, listpage, listitel, listIcons];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
