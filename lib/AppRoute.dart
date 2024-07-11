import 'package:flutter/material.dart';

//import 'screens/onboarding_screen.dart';
import 'screens/Doctor/viwes/DoctorHome.dart';
import 'screens/Location/LocationManually.dart';
import 'screens/Location/fluttermap.dart';
import 'screens/profile/profile.dart';
import 'screens/register/register_market/marketregister.dart';
import 'screens/register/register_vet/register_vet.dart';

class AppRoute {
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      return MaterialPageRoute(builder: (_) => MyHome());
        //return MaterialPageRoute(builder: (_) => const Onboarding());
      case 'screens/register/register_vet/register_vet':
       return MaterialPageRoute(builder: (_) => VetRegisterScreen());
      case 'screens/profile/profile':
       return MaterialPageRoute(builder: (_) =>  ProfileScreen());
       // return MaterialPageRoute(builder: (_) => const SettingsPage());
      case 'screens/register/register_market/marketregister':
       return MaterialPageRoute(builder: (_) => MarketRegister());
      case 'screens/Location/fluttermap':
        return MaterialPageRoute(builder: (_) => const MyFlutterMap());
         case 'screens/Location/LocationManually':
        return MaterialPageRoute(builder: (_) =>  Locationmanually());
      case 'screens/Doctor/DoctorHome':
        return MaterialPageRoute(builder: (_) => MyHome());
      default:

       // return MaterialPageRoute(builder: (_) => const MyHome()); // Default route
    }
  }
}