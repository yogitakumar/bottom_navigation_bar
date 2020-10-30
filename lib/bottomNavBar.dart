import 'package:bottom_navigation_bar/HomePage.dart';
import 'package:bottom_navigation_bar/Profile.dart';
import 'package:bottom_navigation_bar/Settings.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItem = 0;
  final List<Widget> _children = [
    HomePage(),
    Profile(),
    Settings(),
    HomePage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.card_giftcard,
          Icons.camera,
          Icons.pie_chart,
          Icons.person,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      body: _children[_selectedItem],
      /*Center(
        child: Text(
          "Hello from Item $_selectedItem",
          style: TextStyle(fontSize: 26),
        ),
      ),*/
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        @required this.iconList,
        @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
        super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
          color: Color(0xff0C3853),
         /* border: Border(
            bottom: BorderSide(width: 4, color: Colors.orange),
          ),*/
          /*   gradient: LinearGradient(colors: [
              Colors.orange.withOpacity(0.3),
              Colors.orange.withOpacity(0.015),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)*/
          // color: index == _selectedItemIndex ? Colors.green : Colors.white,
        )
            : BoxDecoration(
          color: Color(0xff0C3853),
        ),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.orange : Colors.grey,
        ),
      ),
    );
  }
}
