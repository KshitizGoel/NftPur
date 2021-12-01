import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_logo.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthStore _authStore;

  // @override
  // void initState() {
  //   super.initState();
  //   _passwordFocusNode = FocusNode();
  // }

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
          )
            ..show(context);
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
        color: Colors.orangeAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Google Sign In',
            style: GoogleFonts.italiana(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}
