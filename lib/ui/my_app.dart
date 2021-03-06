import 'package:boilerplate/constants/app_theme.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/repository/auth_repository.dart';
import 'package:boilerplate/data/repository/blockchain_repository.dart';
import 'package:boilerplate/data/repository/repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'main_screen/main_screen.dart';

class MyApp extends StatelessWidget {
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final AuthStore _authStore = AuthStore(getIt<AuthRepository>());
  final BlockchainStore _blockchainStore =
      BlockchainStore(getIt<BlockchainRepository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<AuthStore>(create: (_) => _authStore),
        Provider<BlockchainStore>(create: (_) => _blockchainStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],

            ///TODO :  We may have to remove the Login feature and instead ask the user to integrate your wallet
            home: _authStore.signedInUser
                ? NavigationMainScreen(0)
                : LoginScreen(),
          );
        },
      ),
    );
  }
}
