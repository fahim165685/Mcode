import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/add_product/add_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AddProduct(),
    Center(
      child: Text(
        'No Message Available.',
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        'No Message Available.',
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        'No Message Available.',
        style: TextStyle(fontSize: 30),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                icon: Icon(Icons.add_shopping_cart),
                label: "Add Product"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined,),
                label: "Chat"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_outlined),
                label: "card"
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.notification_add_outlined,),
                label: "massage"
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex=index;
            });
          },
        ),
      body:_widgetOptions.elementAt(_selectedIndex),
    );
  }
}
