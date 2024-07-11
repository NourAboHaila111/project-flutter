import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/screens/Doctor/viwes/favourit.dart';
import 'package:petopia/shared/components/components.dart';
import '../../../constant/AppColor.dart';
import '../Cubit/home_cubit.dart';
import '../Cubit/home_state.dart';
import '../DoctorWidget/Products.dart';
import '../DoctorWidget/customBottomAppbar.dart';
import '../DoctorWidget/myAppbar.dart';
import 'setting.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initialData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.myblue,
                onPressed: () {
                  context.read<HomeCubit>().changePage(0);
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
              bottomNavigationBar: InkWell(
                onTap: () {
                  context.read<HomeCubit>().changePage(0);
                },
                child: BottomAppBar(
                  height: 80,
                  shape: CircularNotchedRectangle(),
                  notchMargin: 20,
                  color: AppColor.myblue,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      MyBottomAppbar(
                        icon: Icons.settings,
                        text: "Settings",
                        onPresse: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Settings(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      MyBottomAppbar(
                        icon: Icons.person,
                        text: "Profile",
                        onPresse: () {
                          navigateTo(context, Settings());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 204, 199, 204),
              body: ListView(
                children: [
                  MyAppbar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.colorBurn,
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 146, 149, 189),
                          ),
                          child: ListView(
                            children: [
                              Text(
                                '  The Best  Product ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'font1',
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.myblue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '  Sell 50% ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'font1',
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 237, 237, 241),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Products",
                              textAlign: TextAlign.start,
                              style: TextStyle(

                                fontSize: 25,
                                fontFamily: 'font1',
                                fontWeight: FontWeight.w300,
                                color: AppColor.myblue,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Categories(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Display Pets",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                                fontWeight: FontWeight.w300,
                                color: AppColor.myblue,
                              ),
                            ),
                          ),
                          // Add your products or pets display here
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
