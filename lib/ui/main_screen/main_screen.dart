import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/landing_page/landing_page.dart';
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
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 30
        ),
      //  selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.grey.shade300),
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Dashboard',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.fiber_new), label: 'New'),
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

// Widget _customBottomNavigationBar() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//     child: Container(
//       height: 80,
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: Colors.lightBlueAccent.shade100.withOpacity(0.45),
//             width: 5),
//         // color: Colors.white,
//         color: Colors.black,
//         boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _customIconButtons(0, Icon(Icons.home)),
//           _customIconButtons(1, Icon(Icons.add_circle_outline)),
//           _customIconButtons(2, Icon(Icons.fiber_new_sharp)),
//           _customIconButtons(3, Icon(Icons.account_balance_wallet)),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _customIconButtons(int i, Icon icon) {
//   return IconButton(
//     onPressed: () => onTappedBar(i),
//     icon: icon,
//     color: Colors.white,
//     // focusColor: Colors.lightBlueAccent.shade100.withOpacity(0.45),
//     // highlightColor: Colors.lightBlueAccent.shade100.withOpacity(0.45),
//     // hoverColor: Colors.lightBlueAccent.shade100.withOpacity(0.45),
//   );
// }
}
