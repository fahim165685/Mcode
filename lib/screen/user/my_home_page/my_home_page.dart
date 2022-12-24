import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/Profile/profile_page.dart';
import 'package:mcode/screen/user/cart/cart_page.dart';
import 'package:mcode/screen/user/favorite/favorite_page.dart';
import 'package:mcode/screen/user/home/home_page.dart';
//
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    FavoritePage(),
    CartPage(),
    Center(
      child: Text(
        'No Message Available.',
        style: TextStyle(fontSize: 30),
      ),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type:BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,),
              label: "favourite"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "card"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined,),
               label: "massage"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined,),
              label: "Profile"
            )
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex=index;
            });
          },
        ),
        body: _widgetOptions.elementAt(_selectedIndex) //Body(),
    );
  }
}