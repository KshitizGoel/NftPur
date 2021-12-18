import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/main_screen/main_screen.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/your_nfts/add_your_wallet.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String mainScreen = '/mainScreen';
  static const String addYourWallet = '/addYourWallet';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    mainScreen: (BuildContext context) => NavigationMainScreen(0),
    addYourWallet: (BuildContext context) => AddYourWallet(),
  };
}
