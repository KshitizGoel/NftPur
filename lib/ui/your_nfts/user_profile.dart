import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(
            height: 120,
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
SizedBox(height: 20,),
          Center(
            child: Text('Kshitiz Goel',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                )),
          ),
          Container(
              height: 80,
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
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
