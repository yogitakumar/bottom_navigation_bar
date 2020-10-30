import 'package:bottom_navigation_bar/HomePage.dart';
import 'package:bottom_navigation_bar/Profile.dart';
import 'package:bottom_navigation_bar/Settings.dart';
import 'package:bottom_navigation_bar/bottomNavBar.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int _selectedItem = 0;
  final List<Widget> _children = [
    HomePage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,),
      body: _children[_selectedItem],
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      NavBar()
    ],
    );
  }
}


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7.0,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              color: Color(0xff0C3853),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ADD TO CART",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.green,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "SHARE NOW",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 /*buildNavBarItem () {
    return Material(
      elevation: 7.0,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.blue,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ADD TO CART",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.green,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "SHARE NOW",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
