
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:servi/screens/services_screen.dart';
import 'package:servi/theme/colors.dart';

import 'account_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  var _hideAppBar = true;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ServicesScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();

  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    final bottomNavigationBar = BottomNavigationBar(
      fixedColor: Theme.of(context).primaryColor,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          title: Text("Overview",),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sync, color: Colors.grey),
            title: Text("Services",)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Colors.grey),
            title: Text("Accounts", )
        ),
      ],
    );

    final s = Scaffold(
      appBar: _hideAppBar ? null : AppBar(
        title: Text("bar", style: textStyle),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );

    return s;
  }

  @override
  dispose(){
    super.dispose();
  }
}