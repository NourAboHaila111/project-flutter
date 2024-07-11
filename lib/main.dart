
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:petopia/screens/register/cubit/cubit.dart';
import 'package:petopia/screens/test/cubit.dart';

import 'package:petopia/shared/components/appLocal.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';
import 'package:petopia/shared/network/remote/dio-helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppRoute.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // ignore: unused_field
  final AppRoute _appRoute = AppRoute();

  // Locale _locale = new Locale('en','US');
  //
  // void _changeLanguage(Locale locale){
  //   _locale = locale;
  //
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => PetRegisterCubit()),
        BlocProvider(create: (context) => LanguageCubit(),)
      ],
      child:  BlocConsumer<LanguageCubit,Locale>(
        listener: (context, state) {

        },
        builder: (context, state) => MaterialApp(

          localizationsDelegates:[
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ] ,
          supportedLocales: [
            Locale("en",""),
            Locale("ar",""),
          ],

          locale: state,

          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
         onGenerateRoute: _appRoute.generateRoute,
        initialRoute: '/',
        ) ,
      ),
    );
  }
}
