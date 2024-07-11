

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/Location/AddressRegisterCubit.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';


// ignore: must_be_immutable
class Locationmanually extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var StreetnameController=TextEditingController();
  var CityController=TextEditingController();
  var  BuildingController=TextEditingController();
  var apartmentController=TextEditingController();
  var ZIPcodeController=TextEditingController();
  String loungeName = '';
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => PetRegisterCubit(),
      child: BlocConsumer<PetRegisterCubit,PetRegisterState>(
        listener: (context, state) {
          if(state is PetRegisterSuccessState)
          {
            if(state.RegisterModel!.status != null)
            {
              print(state.RegisterModel!.message);
              // print(state.loginModel!.data!.token);
              token = state.RegisterModel!.data!.token;
              CachHelper.SaveData(key: 'token', value: token).then((value) {
                token=state.RegisterModel!.data!.token;
                return navigateTo(context, HomeScreen());
              });
              // print(token);

            }else
              print(state.RegisterModel!.message);
          }
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          var cubit = PetRegisterCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('Choose Location',style:TextStyle(color: AppColor.myblue) ,),
            ),
            body: Stack(

              children: [
              Image.asset("images/map2.png", fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:150),
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 231, 232, 234),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    defaultFormField(
                                      controller:StreetnameController,
                                      type: TextInputType.text,
                                      validate:(value){
                                        if (value!.isEmpty)
                                          return 'please enter Street Name';
                                        return null;
                                      },
                                      label: 'Street Name',
                                      prefix: Icons.location_city_rounded,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    defaultFormField(
                                      controller: CityController,
                                      type: TextInputType.text,
                                      validate:(value){
                                        if (value!.isEmpty)
                                          return 'please enter City';
                                        return null;
                                      },
                                      label: 'City',
                                      prefix: Icons.location_city_outlined,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),


                                    defaultFormField(
                                      controller: BuildingController,
                                      type: TextInputType.number,
                                      validate:(value){
                                        if (value!.isEmpty)
                                          return 'please enter building number';
                                        return null;
                                      },
                                      label: 'building number',
                                      prefix: Icons.numbers_outlined,
                                    ),


                                    SizedBox(
                                      height: 20,
                                    ),
                                    defaultFormField(
                                      controller: apartmentController,
                                      type: TextInputType.number,
                                      validate:(value){
                                        if (value!.isEmpty)
                                          return 'please enter apartment number';
                                        return null;
                                      },
                                      label: 'apartment number',
                                      prefix: Icons.numbers_outlined,
                                    ),


                                    SizedBox(
                                      height: 20,
                                    ),

                                    defaultFormField(
                                      controller:ZIPcodeController,
                                      type: TextInputType.number,
                                      validate:(value){
                                        if (value!.isEmpty)
                                          return 'please enter ZIP code';
                                        return null;
                                      },
                                      label: 'ZIP code',
                                      prefix: Icons.location_city_rounded,
                                    ),



                                  ],
                                ),

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(

                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AddressRegisterCubit.get(context).saveAddress(
                              streetName: StreetnameController.text,
                              city:CityController.text,
                              buildingNumber:  BuildingController.text,
                              apartmentNumber: apartmentController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Address Saved')),
                            );
                          }
                        },
                        child: Text('Save Address',style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.myblue,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );

  }
}
