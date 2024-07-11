


import 'package:petopia/screens/Doctor/classes/Applink.dart';

import '../../classes/curd.dart';

class HomeData {
// ignore: non_constant_identifier_names, use_function_type_syntax_for_parameters
//Get.lazyPut(() => Curd());
  late Curd curd;

  HomeData(this.curd);
  showCategories() async {
    // ignore: unused_local_variable
    var response = await curd.getdata(AppLink.categories,{});
    return response.fold((l) => l, (r) => r);
  }
  searchData(String searchword,int page,int limit )async {
    // ignore: unused_local_variable
    var response = await curd.postdata(AppLink.search, {
      "searchword":searchword,
      "page":page.toString(),
      "limit":limit.toString(),
    } as Map<String, dynamic>);
    return response.fold((l) => l, (r) => r);
  }
}
