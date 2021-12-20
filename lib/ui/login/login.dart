import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_logo.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthStore _authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(child: _buildRightSide()),
          // Observer(
          //   builder: (context) {
          //     return _store.success
          //         ? navigate(context)
          //         : _showErrorMessage(_store.errorStore.errorMessage);
          //   },
          // ),
          // Observer(
          //   builder: (context) {
          //     return Visibility(
          //       visible: _store.loading,
          //       child: CustomProgressIndicatorWidget(),
          //     );
          //   },
          // )
        ],
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLogo(100),
            SizedBox(height: 24.0),
            _buildGoogleSignInButton(),

            // Observer(builder: (context))
          ],
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.mainScreen, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  Widget _buildGoogleSignInButton() {
    return InkWell(
      onTap: () {
        _authStore.googleSignIn();

        Future.delayed(Duration(milliseconds: 0), () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.mainScreen, (Route<dynamic> route) => false);
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0 , top: 10 , bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  Assets.signIn,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Center(
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
