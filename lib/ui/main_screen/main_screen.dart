import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/nft_news/nft_trends.dart';
import 'package:boilerplate/ui/post_nft/post_your_nft.dart';
import 'package:boilerplate/ui/your_profile/user_profile.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

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
  late AuthStore _authStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = _indexPassed;
  }

  final List<Widget> _children = [
    HomeScreen(),
    PostYourNft(),
    NFTTrends(),
    Profile(),
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
      body: Observer(
        builder: (context) {
          return _authStore.signedInUser
              ? _children[_currentIndex]
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Please try to Login !'),
                    )
                  ],
                ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _currentIndex,
        backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
        selectedIconTheme: IconThemeData(color: Colors.black, size: 25),
        selectedItemColor: Colors.black,
        selectedFontSize: 17,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 18),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              "Dashboard",
            ),
            backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            title: Text(
              "Post",
            ),
            backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text(
              "Trends",
            ),
            backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text(
              "Profile",
            ),
            backgroundColor: Colors.yellow[700]!.withOpacity(0.80),
          ),
        ],
        onTap: onTappedBar,
      ),
    );
  }
}
