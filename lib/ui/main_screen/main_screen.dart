import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/post/post_your_nft.dart';
import 'package:boilerplate/ui/your_nfts/collections.dart';
import 'package:flutter/material.dart';

class NavigationMainScreen extends StatefulWidget {
  int _indexPassed;

  NavigationMainScreen(this._indexPassed);

  @override
  _NavigationMainScreenState createState() =>
      _NavigationMainScreenState(_indexPassed);
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  int _indexPassed;

  _NavigationMainScreenState(this._indexPassed);

  var _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = _indexPassed;
  }

  final List<Widget> _children = [
    HomeScreen(),
    Collections(),
    PostYourNft(),

  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
        selectedIconTheme:
            IconThemeData(color: Colors.black, size: 25 ),
        selectedItemColor: Colors.black,
        selectedFontSize: 17,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.white,
        unselectedIconTheme:
            IconThemeData(color: Colors.white, size: 18 ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              "Dashboard",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text(
              "Collections",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            title: Text(
              "Post",
            ),
          ),

        ],
        onTap: onTappedBar,
      ),
    );
  }
}
