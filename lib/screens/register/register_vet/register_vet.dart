
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';

class VetRegisterScreen extends StatelessWidget {
  var ClinicnameController = TextEditingController();
  var ClinicphoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var availableTimesController = TextEditingController();
  var actionDurationController = TextEditingController();
  var actionCostController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var actionNameController = TextEditingController();
  List<Map<String, String>> actions = [];
  var dayControllers = List.generate(7, (_) => TextEditingController());

  List<TextEditingController> openTimeControllers =
  List.generate(7, (_) => TextEditingController());
  List<TextEditingController> closeTimeControllers =
  List.generate(7, (_) => TextEditingController());

  String _getDayOfWeek(int index) {
    switch (index) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return '';
    }
  }

  void _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTime =
      localizations.formatTimeOfDay(picked, alwaysUse24HourFormat: false);
      controller.text = formattedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final double? latitude = arguments?['latitude'];
    final double? longitude = arguments?['longitude'];
    print('*****************latitude: ${latitude}');
    print('*****************longitude: ${longitude}');
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
                  "Complete Profile Doctor",
                  style: TextStyle(
                    color: AppColor.mywhait,
                    fontSize: 25,
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
                          height: 400,
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
                                        controller: ClinicnameController,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (value!.isEmpty)
                                            return 'please enter clinic name';
                                          return null;
                                        },
                                        label: 'Clinic Name',
                                        prefix: Icons
                                            .broadcast_on_personal_rounded,
                                      ),
                                      SizedBox(height: 20),
                                      defaultFormField(
                                        controller: ClinicphoneController,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value!.isEmpty)
                                            return 'please enter phone clinic';
                                          return null;
                                        },
                                        label: 'Phone Clinic',
                                        prefix: Icons.phone,
                                      ),
                                      SizedBox(height: 20),
                                      BlocBuilder<PetRegisterCubit, PetRegisterState>(
                                        builder: (context, state) {
                                          return defaultFormField(
                                            controller: openTimeController,
                                            type: TextInputType.none,
                                            validate: (value) {
                                              if (value!.isEmpty)
                                                return 'please select opening time';
                                              return null;
                                            },
                                            onTap: () => _selectTime(context, openTimeController),
                                            label: 'Opening Time',
                                            prefix: Icons.timer,
                                          );
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      BlocBuilder<PetRegisterCubit, PetRegisterState>(
                                        builder: (context, state) {
                                          return defaultFormField(
                                            controller: closeTimeController,
                                            type: TextInputType.none,
                                            validate: (value) {
                                              if (value!.isEmpty)
                                                return 'please select closing time';
                                              return null;
                                            },
                                            onTap: () => _selectTime(context, closeTimeController),
                                            label: 'Closing Time',
                                            prefix: Icons.timer,
                                          );
                                        },
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
                      BlocBuilder<PetRegisterCubit, PetRegisterState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Icon(Icons.timer, color: AppColor.myblue, size: 30),
                              reausableMaterialButton(
                                function: () {
                                  _showAvailableTimesDialog(context);
                                },
                                text: 'Available Times',
                                colortext: AppColor.myblue,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              showLocationDialog(context);
                            },
                            text: 'Add Location',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.timelapse, color: AppColor.myblue, size: 30),
                          reausableMaterialButton(
                            function: () {
                              _showLocationDialogAction(context);
                            },
                            text: 'Add Actions',
                            colortext: AppColor.myblue,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (state is PetRegisterLoadingState)
                        Center(child: CircularProgressIndicator())
                      else

                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(
                                  '*************************************Clinic Name: ${ClinicnameController
                                      .text}');
                              print(
                                  '********************************Phone Clinic: ${ClinicphoneController
                                      .text}');
                              print(
                                  '***************************Opening Time: ${openTimeController
                                      .text}');
                              print(
                                  '*****************Closing Time: ${closeTimeController
                                      .text}');
                              print(
                                  '******************Available Times: ${dayControllers
                                      .map((controller) => controller.text)
                                      .toList()}');
                              print(
                                  '*****************latitude: ${latitude}');
                              print(
                                  '*****************longitude: ${longitude}');
                              print(
                                  '*****************longitude: ${actions}');
                              PetRegisterCubit.get(context).vetRegister(
                                clinicName: ClinicnameController.text,
                                phoneClinic: ClinicphoneController.text,
                                openTime: openTimeController.text,
                                closeTime: closeTimeController.text,
                                latitude: latitude,
                                longitude: longitude,
                                actions: actions,
                                availableTimes: dayControllers.map((
                                    controller) => controller.text).toList(),

                              );
                            }
                          },

                          child: Text('Create Account', style: TextStyle(
                              color: Colors.white),),
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
  void _showLocationDialogAction(BuildContext context) {
    final List<Map<String, dynamic>> predefinedActions = [
      {'name': 'vaccine', 'duration': '', 'cost': ''},
      {'name': 'bath', 'duration': '', 'cost': ''},
      {'name': 'Preview', 'duration': '', 'cost': ''},
    ];

    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<PetRegisterCubit, PetRegisterState>(
          builder: (context, state) {
            final cubit = PetRegisterCubit.get(context);

            return AlertDialog(
              title: Text(
                'Add Your Actions',
                style: TextStyle(fontSize: 20, color: AppColor.myblue),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select an Action',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<Map<String, dynamic>>(
                      items: predefinedActions.map((action) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: action,
                          child: Text(action['name']),
                        );
                      }).toList(),
                      onChanged: (selectedAction) {
                        if (selectedAction != null) {
                          cubit.actionNameController.text = selectedAction['name'];
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Action',
                        prefixIcon: Icon(Icons.assignment),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: cubit.actionCostController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Action Cost',
                        prefixIcon: Icon(Icons.money),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter action cost';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: cubit.actionDurationController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Action Duration (minutes)',
                        prefixIcon: Icon(Icons.timer),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter action duration';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (cubit.actionNameController.text.isNotEmpty &&
                            cubit.actionCostController.text.isNotEmpty &&
                            cubit.actionDurationController.text.isNotEmpty) {
                          cubit.addAction({
                            'name': cubit.actionNameController.text,
                            'cost': cubit.actionCostController.text,
                            'duration': cubit.actionDurationController.text,
                          });
                          cubit.clearActionFields();
                        }
                      },
                      child: Text('Add Action'),
                    ),
                    SizedBox(height: 20),
                    if (cubit.actions.isNotEmpty) ...[
                      Text(
                        'Actions:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: cubit.actions.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, dynamic> action = entry.value;

                          return ListTile(
                            title: Text('Action: ${action['name']}'),
                            subtitle: Text('Cost: ${action['cost']} | Duration: ${action['duration']} minutes'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: AppColor.myblue),
                                  onPressed: () {
                                    _editAction(context, cubit, index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    cubit.removeAction(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: TextStyle(color: AppColor.myblue)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Save', style: TextStyle(color: AppColor.myblue)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editAction(BuildContext context, PetRegisterCubit cubit, int index) {
    cubit.actionNameController.text = cubit.actions[index]['name']!;
    cubit.actionCostController.text = cubit.actions[index]['cost']!;
    cubit.actionDurationController.text = cubit.actions[index]['duration']!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Edit Action',
            style: TextStyle(fontSize: 20, color: AppColor.myblue),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: cubit.actionNameController,
                  decoration: InputDecoration(
                    labelText: 'Action Name',
                    prefixIcon: Icon(Icons.assignment),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter action name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: cubit.actionCostController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Action Cost',
                    prefixIcon: Icon(Icons.money),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter action cost';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: cubit.actionDurationController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Action Duration (minutes)',
                    prefixIcon: Icon(Icons.timer),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter action duration';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: AppColor.myblue)),
            ),
            TextButton(
              onPressed: () {
                if (cubit.actionNameController.text.isNotEmpty &&
                    cubit.actionCostController.text.isNotEmpty &&
                    cubit.actionDurationController.text.isNotEmpty) {
                  cubit.updateAction(index, {
                    'name': cubit.actionNameController.text,
                    'cost': cubit.actionCostController.text,
                    'duration': cubit.actionDurationController.text,
                  });
                  cubit.clearActionFields();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save', style: TextStyle(color: AppColor.myblue)),
            ),
          ],
        );
      },
    );
  }
  void showLocationDialog(BuildContext context) {
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
                child: Image.asset("images/map2.png", fit: BoxFit.cover,
                    height: 350,
                    width: 350),
              ),
              ListTile(
                title: Text('Enter Location Manually',
                    style: TextStyle(fontSize: 17, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushNamed('screens/Location/LocationManually');
                },
              ),
              ListTile(
                title: Text('Use GPS',
                    style: TextStyle(fontSize: 20, color: AppColor.myblue)),
                onTap: () {
                  Navigator.of(context).pushNamed('screens/Location/fluttermap');
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _showAvailableTimesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Available Times for Each Day'),
          content: Container(
            width: double.minPositive,
            height: 400, // Set a fixed height to allow scrolling
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                String dayOfWeek = _getDayOfWeek(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: openTimeControllers[index],
                          decoration: InputDecoration(
                            labelText: '$dayOfWeek - Start',
                            hintText: 'Start Time',
                          ),
                          keyboardType: TextInputType.none,
                          onTap: () => _selectTime(context, openTimeControllers[index]),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: closeTimeControllers[index],
                          decoration: InputDecoration(
                            labelText: '$dayOfWeek - End',
                            hintText: 'End Time',
                          ),
                          keyboardType: TextInputType.none,
                          onTap: () => _selectTime(context, closeTimeControllers[index]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
                // Save the entered times
                List<String> availableTimes = List.generate(7, (index) {
                  String day = _getDayOfWeek(index);
                  String start = openTimeControllers[index].text;
                  String end = closeTimeControllers[index].text;
                  return 'Available Times for $day: $start - $end';
                });

                // Print the available times
                availableTimes.forEach((time) {
                  print(time);
                });

                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

}}

