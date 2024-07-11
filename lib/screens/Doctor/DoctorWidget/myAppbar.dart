import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petopia/constant/AppColor.dart';


class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppColor.myblue,
      child: Row(children: [
        IconButton(
          icon: const Icon(
            Icons.person,
            color:Colors.white,
            size: 30,
          ), onPressed: () {  },),
        const Text("DoctorHome",
            style: TextStyle(
             // fontFamily: 'font1',
              color: Colors.white,
              fontSize: 22,
            )),
        const SizedBox(
          width: 150,
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
           // Get.toNamed(AppRoute.cart);
          },
        )
      ]),
    );
  }
}