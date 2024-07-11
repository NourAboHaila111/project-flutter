

/*import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/components/constants.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';


// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  var nameController=TextEditingController();
  var locationController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
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
              title: Text('Register Doctor'),
            ),
            body: Center(
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
                          controller: nameController,
                          type: TextInputType.text,
                          validate:(value){
                            if (value!.isEmpty)
                              return 'please enter name';
                            return null;
                          },
                          label: 'name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate:(value){
                            if (value!.isEmpty)
                              return 'please enter phone';
                            return null;
                          },
                          label: 'phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: locationController,
                          type: TextInputType.text,
                          validate:(value){
                            if (value!.isEmpty)
                              return 'please enter location';
                            return null;
                          },
                          label: 'location',
                          prefix: Icons.location_on_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate:(value){
                            if (value!.isEmpty)
                              return 'please enter emailAddress';
                            return null;
                          },
                          label: 'EmailAddress',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate:(value){
                            if (value!.isEmpty)
                              return 'please enter password';
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: PetRegisterCubit.get(context).Suffix,
                          obscuretext: PetRegisterCubit.get(context).isPassword,
                          suffixpressed: () {
                            PetRegisterCubit.get(context).ChangePassword();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<PetRegisterCubit, PetRegisterState>(
                          builder: (context, state) {
                            var cubit = PetRegisterCubit.get(context);
                            return defaultFormField(
                              validate:(value){
                                if (value!.isEmpty)
                                  return 'please enter time';
                                return null;
                              },
                            //  readOnly: true,
                              controller: TextEditingController(
                                text: cubit.selectedTime?.format(context) ?? '',
                              ),
                              type: TextInputType.none,
                              onTap: () => cubit.selectTime(context),
                              label: 'Select open Time',
                              prefix: Icons.timer,
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<PetRegisterCubit, PetRegisterState>(
                          builder: (context, state) {
                            var cubit = PetRegisterCubit.get(context);
                            return defaultFormField(
                              validate:(value){
                                if (value!.isEmpty)
                                  return 'please enter time';
                                return null;
                              },
                              //  readOnly: true,
                              controller: TextEditingController(
                                text: cubit.selectedTime?.format(context) ?? '',
                              ),
                              type: TextInputType.none,
                              onTap: () => cubit.selectTime(context),
                              label: 'Select close Time',
                              prefix: Icons.timer,
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'medical certificate Images',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                PetRegisterCubit.get(context).loungeImages == null || PetRegisterCubit.get(context).loungeImages!.isEmpty
                                    ? Center(
                                  child: defaultButton(
                                    width: 150,
                                    function: PetRegisterCubit.get(context).chooseImage,
                                    text: 'Choose Images',
                                  ),
                                )
                                    : SizedBox(
                                  height: 200.0,
                                  child:ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: PetRegisterCubit.get(context).loungeImages!.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image.file(
                                              PetRegisterCubit.get(context).loungeImages![index],
                                              height: 200.0,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () =>PetRegisterCubit.get(context).deleteImage(index),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                radius: 12.0,
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // defaultFormField(
                        //   controller: passwordConfirmController,
                        //   type: TextInputType.visiblePassword,
                        //   validate:(value){
                        //     if (value!.isEmpty)
                        //       return 'please enter confirm password';
                        //   },
                        //   label: 'Confirm Password',
                        //   prefix: Icons.lock,
                        //   suffix: PetRegisterCubit.get(context).Suffix,
                        //   obscuretext: PetRegisterCubit.get(context).isPassword,
                        //   suffixpressed: () {
                        //     PetRegisterCubit.get(context).ChangePassword();
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) => defaultButton(
                              width: double.infinity,
                              function: (){
                                if(formKey.currentState!.validate()){
                                  PetRegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              text: 'Create Account'
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
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
}
*/