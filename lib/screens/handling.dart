
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

import '../constant/classes/statuesrequest.dart';

class HandlingDataViwe extends StatelessWidget {
  final StatuesRequest statuesRequest;
  final Widget widget;
  const HandlingDataViwe({super.key, required this.statuesRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statuesRequest==StatuesRequest.loading? Center(child:Lottie.asset("imagelotti/animation_lku9ocsc.json",width: 300) ,):
    statuesRequest==StatuesRequest.serverfailure? Center(child:Lottie.asset("imagelotti/animation_lkub85jz.json",width: 200) ): widget;
  }
}
