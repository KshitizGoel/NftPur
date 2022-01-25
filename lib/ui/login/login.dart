import 'dart:ui' as ui;

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthStore _authStore;

  final String welcomeText = "Welcome Back!";
  final String welcomeText2 = "Please sign in to continue";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Align(alignment: Alignment.centerLeft, child: _customIconWidget()),
            SizedBox(height: 50.0),
            _welcomeText(),
            _subInfoText(),
            SizedBox(height: 15.0),
            _buildEmailForm(),
            SizedBox(height: 50.0),
            _submitButton(),
            SizedBox(height: 15.0),

            _orText(),
            SizedBox(
              height: 20,
            ),
            _buildGoogleSignInButton(),

            // _buildMobileLogin(),
            // Observer(builder: (context))
          ],
        ),
      ),
    );
  }

  Widget _customIconWidget() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.letsGetStarted),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        child: Text(
          welcomeText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
    );
  }

  Widget _subInfoText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: Text(
          welcomeText2,
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return Container(
      child: Column(
        children: [
          _customTextField(
              _emailController, Icons.email_outlined, 'Email', false),
          SizedBox(
            height: 30,
          ),
          _customTextField(
              _passwordController, Icons.password_outlined, 'Password', true),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.login),
          child: CustomButton(
            color: Colors.indigo.shade600,
            buttonText: 'submit'.toUpperCase(),
            horizontalMargin: 0,
          ),
        ));
  }

  Widget _orText() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        child: Text(
          'or'.toUpperCase(),
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return InkWell(
      onTap: () async {
        await _authStore.googleSignIn();

        Future.delayed(Duration(milliseconds: 0), () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.mobileAuth, (Route<dynamic> route) => false);
        });
      },
      child: Container(
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Assets.signIn,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _customTextField(TextEditingController controller, IconData icon,
      String hintText, bool isObscure) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          textDirection: ui.TextDirection.ltr,
          keyboardType: TextInputType.emailAddress,
          obscureText: isObscure,
          decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(
                icon,
                color: Colors.grey.shade600,
              )),
          // onChanged: (value) => controller.text = value,
          onFieldSubmitted: (value) => controller.text = value,
        ),
      ),
    );
  }

// Widget _buildMobileLogin() {
//   return InkWell(
//     onTap: () async => Navigator.of(context).pushNamed(Routes.mobileAuth),
//     child: Container(
//       height: 60,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Padding(
//               padding: const EdgeInsets.only(left: 40.0, top: 10, bottom: 10),
//               child: Icon(
//                 Icons.mobile_friendly_outlined,
//                 color: Colors.grey.shade800,
//                 size: 25,
//               )),
//           Padding(
//             padding: const EdgeInsets.only(right: 40.0),
//             child: Center(
//               child: Text(
//                 'Continue with mobile phone',
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
}
