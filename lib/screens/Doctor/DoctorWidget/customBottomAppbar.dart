import 'package:flutter/material.dart';

import '../../../constant/AppColor.dart';


// ignore: must_be_immutable
class MyBottomAppbar extends StatelessWidget {
  void Function()? onpress;
  final IconData icon;
  final String text;

  bool ? active;
  MyBottomAppbar({

    required this.icon,
    required this.text,
    required void Function()? onPresse,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icon,
          color: active == true
              ? AppColor.myblue
              : Colors.white,
          size: 30,
        ),
        Text(
          text,
          style: TextStyle(
              color: active == true
                  ?  AppColor.myblue
                  : Colors.white,
              fontSize: 15),
        ),
      ]),
    );
  }
}
