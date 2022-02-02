import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/main_screen/main_screen.dart';
import 'package:boilerplate/ui/mobile_auth/mobile_auth.dart';
import 'package:boilerplate/ui/mobile_auth/verify_otp.dart';
import 'package:boilerplate/ui/nft_list/nft_list.dart';
import 'package:boilerplate/ui/onboarding_screen/lets_get_started.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/your_profile/add_your_wallet.dart';
import 'package:boilerplate/ui/your_profile/wallet_details.dart';
import 'package:boilerplate/ui/your_profile/wallet_intermediary_file.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String mainScreen = '/mainScreen';
  static const String makeYourNFT = '/makeYourNFT';
  static const String addYourWallet = '/addYourWallet';
  static const String walletDetails = '/walletDetails';
  static const String wallet = '/wallet';
  static const String nftList = '/nftList';
  static const String mobileAuth = '/mobileAuth';
  static const String letsGetStarted = '/letsGetStarted';
  static const String verifyOTP = '/verifyOTP';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => TrendingScreen(),
    mainScreen: (BuildContext context) => NavigationMainScreen(0),
    addYourWallet: (BuildContext context) => AddYourWallet(),
    walletDetails: (BuildContext context) => WalletDetails(),
    wallet: (BuildContext context) => Wallet(),
    nftList: (BuildContext context) => NftList(),
    mobileAuth: (BuildContext context) => MobileAuth(),
    makeYourNFT: (BuildContext context) => NavigationMainScreen(1),
    letsGetStarted: (BuildContext context) => LetsGetStarted(),
    verifyOTP: (BuildContext context) => VerifyOTP(),
  };
}
