import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/ui/landing_page/landing_page.dart';
import 'package:boilerplate/ui/post_nft/post_your_nft.dart';
import 'package:boilerplate/ui/trending/trending_home_page.dart';
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
    LandingScreen(),
    PostYourNft(),
    TrendingScreen(),
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
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
        unselectedIconTheme: IconThemeData(color: Colors.grey.shade300),
        elevation: 50,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: 'Wallet'),
        ],
        onTap: onTappedBar,
      ),
    );
  }
}
