import 'package:petopia/model/filtter_model.dart';


abstract class FilterState {
  FilterModel get filter;
}

class FilterInitial extends FilterState {
  final FilterModel initialFilter;
  FilterInitial(this.initialFilter);

  @override
  FilterModel get filter => initialFilter;
}

class FilterUpdated extends FilterState {
  final FilterModel updatedFilter;
  FilterUpdated(this.updatedFilter);

  @override
  FilterModel get filter => updatedFilter;
}
