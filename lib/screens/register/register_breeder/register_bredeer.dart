import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/Cach_Helper.dart';
import '../../home/home.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class PetRegisterScreen extends StatelessWidget {
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

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
          return  Scaffold(
            appBar: AppBar(
              title: Text('Register'),
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
