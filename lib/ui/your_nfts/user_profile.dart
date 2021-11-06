import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 20,
              child: _buildLogoutButton(),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 120),
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow.shade500, Colors.deepOrangeAccent]),
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  Assets.profilePicture,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Kshitiz Goel',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                )),
          ),
          SizedBox(height: 20,),

          Center(
            child: Text('kshitizgoel11@gmail.com',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w900 , color: Colors.blueAccent),
                )),
          ),
          SizedBox(height: 20,),

          Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0  , vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _customColumn('Your NFTs', '6'),
                    _customColumn('Wallet', '250'),
                    _customColumn('Followers', '9'),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _customColumn(String heading, String data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            heading,
            style: GoogleFonts.italiana(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 8.0 , right: 8 , bottom: 5),
          child: Text(
            data,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        )
      ],
    );
  }


  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        SharedPreferences.getInstance().then((preference) {
          preference.setBool(Preferences.is_logged_in, false);
          Navigator.of(context).pushReplacementNamed(Routes.login);
        });
      },
      icon: Icon(
        Icons.logout,
      ),
    );
  }
}
