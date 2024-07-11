
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/Location/LocationManually.dart';
import 'package:petopia/screens/Location/fluttermap.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';

class MarketRegister extends StatelessWidget {
  var MarketnameController = TextEditingController();
  var MarketphoneController = TextEditingController();
  var DilevryphoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var dController = TextEditingController();
  //var actionDurationController = TextEditingController();

  String? deliveryOption;

  MarketRegister({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetRegisterCubit(),
      child: BlocConsumer<PetRegisterCubit, PetRegisterState>(
        listener: (context, state) {
          if (state is PetRegisterSuccessState) {
            if (state.RegisterModel!.status != null) {
              print(state.RegisterModel!.message);
              token = state.RegisterModel!.data!.token;
              CachHelper.SaveData(key: 'token', value: token).then((value) {
                token = state.RegisterModel!.data!.token;
                navigateTo(context, HomeScreen());
              });
            } else {
              print(state.RegisterModel!.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = PetRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.myblue,
              title: Center(
                child: Text(
                  "Complete Profile Market",
                  style: TextStyle(
                    color: AppColor.mywhait,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            backgroundColor: AppColor.myblue,
            body: Stack(
              children: [
                Container(
                  //
                  //  margin:EdgeInsets.only(),
                  //margin: const EdgeInsets.only(top: 90),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 223, 219, 219),
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(70),
                        topRight: Radius.circular(570)),

                  ),
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 250,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.mywhait,
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
                                        controller: MarketnameController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value!.isEmpty) return 'please enter Market name';
                                          return null;
                                        },
                                        label: 'Market Name',
                                        prefix: Icons.broadcast_on_personal_rounded,
                                      ),
                                      SizedBox(height: 20),
                                      defaultFormField(
                                        controller: MarketphoneController,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value!.isEmpty) return 'please enter phone Market';
                                          return null;
                                        },
                                        label: 'Phone Market',
                                        prefix: Icons.phone,
                                      ),



                                     // SizedBox(height: 20),
                                      SizedBox(height: 20),
                                      defaultFormField(
                                        controller: DilevryphoneController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value!.isEmpty) return 'please enter dilevry Market';
                                          return null;
                                        },
                                        label: 'Dilevry Market',
                                        prefix: Icons.phone,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              _showLocationDialog(context);
                            },
                            text: 'Add Location',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),


                      SizedBox(height: 100),
                      if (state is PetRegisterLoadingState)
                        Center(child: CircularProgressIndicator())
                      else
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              PetRegisterCubit.get(context).MarketRegister(
                                marketName:MarketnameController.text ,
                              phonemarket:MarketphoneController.text ,
                              delivry: DilevryphoneController.text
                              /*  clinicName: ClinicnameController.text,
                                phoneClinic: ClinicphoneController.text,
                                openTime: openTimeController.text,
                                closeTime : closeTimeController.text,*/
                                // availableTimes: dayControllers,
                              );
                            }
                          },
                          child: Text('Create Account',style: TextStyle(color: Colors.white),),
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

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Location Method', style: TextStyle(fontSize: 20, color: AppColor.myblue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("images/map2.png", fit: BoxFit.cover, height: 350, width: 350),
              ),
              ListTile(
                title: Text('Enter Location Manually', style: TextStyle(fontSize: 17, color: AppColor.myblue)),
                onTap: () {
                  //navigateTo(context,Locationmanually);
                  Navigator.of(context).pushReplacementNamed('screens/Location/LocationManually');
                },
              ),
              ListTile(
                title: Text('Use GPS', style: TextStyle(fontSize: 20, color: AppColor.myblue)),
                onTap: () {
                  //navigateTo(context,MyFlutterMap);
                  Navigator.of(context).pushReplacementNamed('screens/Location/fluttermap');
                },
              ),
            ],
          ),
        );
      },
    );
  }


  void _showDeliveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Delivery Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Yes'),
                leading: Radio<String>(
                  value: 'yes',
                  groupValue: deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      deliveryOption = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('No'),
                leading: Radio<String>(
                  value: 'no',
                  groupValue: deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      deliveryOption = value;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Process the selected option
                print('Delivery Option: $deliveryOption');
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

}*/
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/Location/LocationManually.dart';
import 'package:petopia/screens/Location/fluttermap.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';

class MarketRegister extends StatefulWidget {
  MarketRegister({super.key});

  @override
  _MarketRegisterState createState() => _MarketRegisterState();
}

class _MarketRegisterState extends State<MarketRegister> {
  var MarketnameController = TextEditingController();
  var MarketphoneController = TextEditingController();
  var DilevryphoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var dController = TextEditingController();
  String? deliveryOption;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>?;
    final double? latitude = arguments?['latitude'];
    final double? longitude = arguments?['longitude'];
    return BlocProvider(
      create: (context) => PetRegisterCubit(),
      child: BlocConsumer<PetRegisterCubit, PetRegisterState>(
        listener: (context, state) {
          if (state is PetRegisterSuccessState) {
            if (state.RegisterModel!.status != null) {
              print(state.RegisterModel!.message);
              token = state.RegisterModel!.data!.token;
              CachHelper.SaveData(key: 'token', value: token).then((value) {
                token = state.RegisterModel!.data!.token;
                navigateTo(context, HomeScreen());
              });
            } else {
              print(state.RegisterModel!.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = PetRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.myblue,
              title: Center(
                child: Text(
                  "Complete Profile Market",
                  style: TextStyle(
                    color: AppColor.mywhait,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            backgroundColor: AppColor.myblue,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 223, 219, 219),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(570),
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 20, right: 20, bottom: 40),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.mywhait,
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      defaultFormField(
                                        controller: MarketnameController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value!.isEmpty)
                                            return 'please enter Market name';
                                          return null;
                                        },
                                        label: 'Market Name',
                                        prefix:
                                        Icons.broadcast_on_personal_rounded,
                                      ),
                                      SizedBox(height: 20),
                                      defaultFormField(
                                        controller: MarketphoneController,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value!.isEmpty)
                                            return 'please enter phone Market';
                                          return null;
                                        },
                                        label: 'Phone Market',
                                        prefix: Icons.phone,
                                      ),
                                      SizedBox(height: 20),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              _showLocationDialog(context);
                            },
                            text: 'Add Location',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.delivery_dining,
                              color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              _showDeliveryDialog(context);
                            },
                            text: 'Delivery Service',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      if (state is PetRegisterLoadingState)
                        Center(child: CircularProgressIndicator())
                      else
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(
                                  '*************************************Clinic Name: ${MarketnameController
                                      .text}');
                              print(
                                  '********************************Phone Clinic: ${MarketphoneController
                                      .text}');
                              print(
                                  '***************************Opening Time: ${deliveryOption
                                      }');
                              print(
                                  '*****************latitude: ${latitude}');
                              print(
                                  '*****************longitude: ${longitude}');
                              PetRegisterCubit.get(context).MarketRegister(
                                marketName: MarketnameController.text,
                                phonemarket: MarketphoneController.text,
                                delivry: deliveryOption,
                              );
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                          ),
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

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Location Method',
              style: TextStyle(fontSize: 20, color: AppColor.myblue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("images/map2.png",
                    fit: BoxFit.cover, height: 350, width: 350),
              ),
              ListTile(
                title: Text('Enter Location Manually',
                    style: TextStyle(fontSize: 17, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      'screens/Location/LocationManually');
                },
              ),
              ListTile(
                title: Text('Use GPS',
                    style: TextStyle(fontSize: 20, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      'screens/Location/fluttermap');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeliveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Delivery Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Yes'),
                leading: Radio<String>(
                  value: 'yes',
                  groupValue: deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      deliveryOption = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('No'),
                leading: Radio<String>(
                  value: 'no',
                  groupValue: deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      deliveryOption = value;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Process the selected option
                print('Delivery Option: $deliveryOption');
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/Location/LocationManually.dart';
import 'package:petopia/screens/Location/fluttermap.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';

class MarketRegister extends StatelessWidget {
  MarketRegister({super.key});

  final MarketnameController = TextEditingController();
  final MarketphoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final double? latitude = arguments?['latitude'];
    final double? longitude = arguments?['longitude'];

    return BlocProvider(
      create: (context) => PetRegisterCubit(),
      child: BlocConsumer<PetRegisterCubit, PetRegisterState>(
        listener: (context, state) {
          if (state is PetRegisterSuccessState) {
            if (state.RegisterModel!.status != null) {
              print(state.RegisterModel!.message);
              // Handle success, for example, navigate to another screen
            } else {
              print(state.RegisterModel!.message);
            }
          } else if (state is PetRegisterErrorState) {
            // Handle error
            print(state.error);
          }
        },
        builder: (context, state) {
          var cubit = PetRegisterCubit.get(context);
          String? deliveryOption = cubit.deliveryOption;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.myblue,
              title: Center(
                child: Text(
                  "Complete Profile Market",
                  style: TextStyle(
                    color: AppColor.mywhait,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            backgroundColor: AppColor.myblue,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 223, 219, 219),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(570),
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.mywhait,
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
                                        controller: MarketnameController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value!.isEmpty) return 'please enter Market name';
                                          return null;
                                        },
                                        label: 'Market Name',
                                        prefix: Icons.broadcast_on_personal_rounded,
                                      ),
                                      SizedBox(height: 20),
                                      defaultFormField(
                                        controller: MarketphoneController,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value!.isEmpty) return 'please enter phone Market';
                                          return null;
                                        },
                                        label: 'Phone Market',
                                        prefix: Icons.phone,
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              _showLocationDialog(context);
                            },
                            text: 'Add Location',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    /*  Row(
                        children: [
                          Icon(Icons.delivery_dining, color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                             // _showDeliveryDialog(context);
                              _showDeliveryOptionSheet(context);
                            },
                            text: 'Delivery Service',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),*/
                      Row(
                        children: [
                          Icon(Icons.delivery_dining, color: AppColor.myblue, size: 30) ,
                          SizedBox(width: 15,),
                          DropdownButton<String>(
                            //Icon(Icons.delivery_dining, color: AppColor.myblue, size: 30) ,
                            value: PetRegisterCubit.get(context).deliveryOption,
                            hint: Text('Select Delivery Option',style: TextStyle(color: AppColor.myblue,fontSize: 20),),
                            items: <String>['Yes', 'No'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                PetRegisterCubit.get(context).setDeliveryOption(newValue);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      if (state is PetRegisterLoadingState)
                        Center(child: CircularProgressIndicator())
                      else
                        MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('....................Market Name: ${MarketnameController.text}');
                              print('................Phone Market: ${MarketphoneController.text}');
                              print('.......Delivery Option: ${PetRegisterCubit.get(context).deliveryOption ?? 'Not selected'}');
                              print('.........Latitude: ${latitude}');
                              print('..........Longitude: ${longitude}');
                              PetRegisterCubit.get(context).MarketRegister(
                                marketName: MarketnameController.text,
                                phonemarket: MarketphoneController.text,
                                delivry: PetRegisterCubit.get(context).deliveryOption,
                                latitude: latitude,
                                longitude: longitude,
                              );
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: AppColor.myblue,
                          height: 50,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
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

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Location Method', style: TextStyle(fontSize: 20, color: AppColor.myblue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("images/map2.png", fit: BoxFit.cover, height: 350, width: 350),
              ),
              ListTile(
                title: Text('Enter Location Manually', style: TextStyle(fontSize: 17, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('screens/Location/LocationManually');
                },
              ),
              ListTile(
                title: Text('Use GPS', style: TextStyle(fontSize: 20, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('screens/Location/fluttermap');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /*void _showDeliveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Delivery Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Yes'),
                leading: Radio<String>(
                  value: 'yes',
                  groupValue: PetRegisterCubit.get(context).deliveryOption,
                  onChanged: (value) {
                    PetRegisterCubit.get(context).updateDeliveryOption(value);
                  },
                ),
              ),
              ListTile(
                title: Text('No'),
                leading: Radio<String>(
                  value: 'no',
                  groupValue: PetRegisterCubit.get(context).deliveryOption,
                  onChanged: (value) {
                    PetRegisterCubit.get(context).updateDeliveryOption(value);
                  },
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Perform save operation here if needed
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
  void _showDeliveryOptionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Delivery Option',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text('Yes'),
                leading: Radio<String>(
                  value: 'yes',
                  groupValue: PetRegisterCubit.get(context).deliveryOption,
                  onChanged: (value) {
                    PetRegisterCubit.get(context).updateDeliveryOption(value);
                    Navigator.pop(context);
                    // Close the bottom sheet after selection
                    print('.......mmmmmmmmmmmmmm.................Delivery Option: ${PetRegisterCubit.get(context).deliveryOption ?? 'Not selected'}');
                  },
                ),
              ),
              ListTile(
                title: Text('No'),
                leading: Radio<String>(
                  value: 'no',
                  groupValue: PetRegisterCubit.get(context).deliveryOption,
                  onChanged: (value) {
                    PetRegisterCubit.get(context).updateDeliveryOption(value);
                    Navigator.pop(context); // Close the bottom sheet after selection
                    print('.......kkkkkkkkkkkkkk.................Delivery Option: ${PetRegisterCubit.get(context).deliveryOption ?? 'Not selected'}');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }*/



}
