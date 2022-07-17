import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/favourit/favourit.dart';
import 'package:real_state/page/botoomNavigation/homePage/home.dart';
import 'package:real_state/page/botoomNavigation/profile/profileList.dart';
import 'package:real_state/page/botoomNavigation/profile/profilePage.dart';
import 'package:real_state/page/botoomNavigation/searchPage/searchPage.dart';

class Mall extends StatefulWidget {
  int index;
  var userData;
  Mall({Key? key, required this.index, this.userData}) : super(key: key);

  @override
  _MallState createState() => _MallState();
}

class _MallState extends State<Mall> {
  var loginUser;
  var data;
  List details = [];
  // ignore: prefer_final_fields @override
  @override
  void initState() {
    super.initState();
    // print(widget.userData);
    setState(() {
      loginUser = widget.userData;
      // data = loginUser;
      // ignore: avoid_print
      print(loginUser);
      // _fetchPost();

      _selectedItem = widget.index;
    });
  }

  // ignore: prefer_final_fields
  var _pageData = [
    HomeScreen(),
    SearchPage(),
    FavouritPage(),
    ProfileList(),
  ];
  int _selectedItem = 0;
  bool isCartClicked = false;

  // bool loadData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageData[_selectedItem],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 10,
        child: const Icon(Icons.add),
        onPressed: () {
          print("i am here");
          // AddItemsPAge();
          // Overlay.of(context).insert(entry);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        // enableFeedback: false,
        iconSize: 30,
        selectedIconTheme: const IconThemeData(
          color: Color(0xffe75517),
        ),
        unselectedItemColor: Color(0xffe75517),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.search),
            label: "",
          ),
          // BottomNavigationBarItem(
          //   tooltip: "",
          //   icon: Icon(Icons.add_circle_outline_outlined),
          //   label: "",
          // ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.black,
        onTap: (setValue) {
          if (setValue == 2) {
            setState(() {
              isCartClicked = true;
              _selectedItem = setValue;
            });
          } else {
            setState(() {
              isCartClicked = false;
              _selectedItem = setValue;
            });
          }
        },
      ),
    );
  }
}
