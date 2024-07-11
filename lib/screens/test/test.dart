import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/register/cubit/state.dart';
import 'package:petopia/screens/test/cubit.dart';

import '../../shared/components/appLocal.dart';
import '../../shared/components/components.dart';
import '../fillter/fillter.dart';


class Test extends StatelessWidget {
  final void Function(Locale) changeLanguage;
  const Test({required this.changeLanguage});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetRegisterCubit(),
      child: BlocConsumer<PetRegisterCubit,PetRegisterState>(
        listener: (context, state) {

        },
        builder: (context, state) =>Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.grey[200],
            title: Text('الصفحة الرئسية'),
          ),
          body: Column(
            children: [
              Container(
                child: Text('${getLang(context, "welcome")}'),
              ),
              defaultButton(width: 100, function: (){
                // ShopCubit.get(context).changeLang("en");
                if(BlocProvider.of<LanguageCubit>(context).state.languageCode == 'ar'){
                  BlocProvider.of<LanguageCubit>(context).changeLanguage(new Locale('en'));

                }
                else{
                  BlocProvider.of<LanguageCubit>(context).changeLanguage(new Locale('ar'));

                }

              }, text: BlocProvider.of<LanguageCubit>(context).state.languageCode == 'ar'?'en':'ar'),
              defaultButton(
                  width: 150,
                  function: (){
                    navigateTo(context, FilterScreen());
                  },
                  text: 'text'
              ),

            ],
          ),
        ) ,
      ),
    );
    
  }
}
