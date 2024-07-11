
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petopia/screens/profile/cubit/cubit.dart';
import 'package:petopia/screens/profile/cubit/states.dart';
import 'package:petopia/shared/components/components.dart';

import '../../shared/components/appLocal.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
 //String? selectedGender;
  // File? _image ;
  //TextEditingController _dateController = TextEditingController();
 // DateTime? _selectedDate;
  TextEditingController nameARController=TextEditingController();
  TextEditingController nameENController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  TextEditingController ConfirmPasswordController=TextEditingController();
  var formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          final cubit=ProfileCubit.get(context);
          return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${getLang(context, "Complete your profile")}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap:(){
                            showImageSourceDialog(context,cubit);
                            },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundImage:cubit.images == null?null : FileImage(cubit.images!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10,
                                    right: 10
                                ),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.grey,
                                  child: Transform.scale(
                                    scale: 1.5,
                                    child: Icon(
                                        color: Colors.white,
                                        Icons.add
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                          controller: nameENController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          label: 'Enter your full name',
                        labelText: 'Full Name (English)',
                          prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: nameARController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        label: 'Enter your full name',
                        labelText: 'Full Name (Arabic)',
                        prefix: Icons.person,
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showDatePicker(
                      //       context: context,
                      //       initialDate: ProfileCubit.get(context).selectedDate ?? DateTime.now(),
                      //       //222222222222222
                      //       firstDate: DateTime(1900),
                      //       lastDate: DateTime.now(),
                      //     ).then((pickedDate) {
                      //       if (pickedDate != null) {
                      //         ProfileCubit.get(context).selectDate(pickedDate);
                      //         // setState(() {
                      //         //   _selectedDate = pickedDate;
                      //         //   _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                      //         // });
                      //       }
                      //     });
                      //   },
                      //   child: AbsorbPointer(
                      //     child: TextFormField(
                      //       controller: ProfileCubit.get(context).dateController,
                      //       //3333333333333333333
                      //       keyboardType: TextInputType.datetime,
                      //       decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(15.0),
                      //         ),
                      //         labelText: 'Date of Birth',
                      //         hintText: 'Enter your date of birth',
                      //       ),
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return 'Please enter your date of birth';
                      //         }
                      //         return null;
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // DropdownButtonFormField<String>(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //     labelText: 'Gender',
                      //     hintText: 'Select your gender',
                      //   ),
                      //   value: ProfileCubit.get(context).selectedGender,
                      //   onChanged: (newValue) {
                      //     ProfileCubit.get(context).changeGender(newValue!);
                      //   },
                      //   items: [
                      //     DropdownMenuItem(
                      //       value: 'Male',
                      //       child: Text('Male'),
                      //     ),
                      //     DropdownMenuItem(
                      //       value: 'Female',
                      //       child: Text('Female'),
                      //     ),
                      //   ],
                      //   validator: (value) {
                      //     if (value == null) {
                      //       return 'Please select your gender';
                      //     }
                      //     return null;
                      //   },
                      // ),

                      defaultFormField(
                          controller: EmailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        labelText:'Email' ,
                          label: 'Enter your Email',
                          prefix: Icons.email_outlined,
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      defaultFormField(
                        controller: PasswordController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        labelText:'Password' ,
                        label: 'Enter your Password',
                        prefix: Icons.lock_outline,
                        suffix: cubit.Suffix,
                        suffixpressed:(){cubit.ChangePassword();},
                        obscuretext:cubit.isPassword

                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: ConfirmPasswordController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Confirm Password';
                          }
                          return null;
                        },
                        labelText:'Confirm Password' ,
                        label: 'Enter your Confirm Password',
                        prefix: Icons.lock_outline,
                        suffix: cubit.Suffix,
                        suffixpressed:(){cubit.ChangePassword();},
                        obscuretext:cubit.isPassword
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is !ProfileLoadingProfileDataState,
                        builder:(context) =>  defaultButton(
                            fontColor: Colors.white,
                            width: double.infinity,
                            function: (){
                              if(formKey.currentState!.validate()) {
                                cubit.sendData(
                                    nameAR: nameARController.text,
                                    nameEN: nameENController.text,
                                    email: EmailController.text,
                                    password: PasswordController.text,
                                    confirm_password: ConfirmPasswordController
                                        .text,
                                    image: cubit.images
                                );
                              }
                            },
                            text: 'continue'
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()) ,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        },
      ),
    );
  }

  void showImageSourceDialog(BuildContext context, ProfileCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.pop(dialogContext);
                    cubit.pickImage(ImageSource.camera);
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.pop(dialogContext);
                    cubit.pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

