import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/addItems/addItemsPAge.dart';
import 'package:real_state/page/botoomNavigation/favourit/favourit.dart';
import 'package:real_state/page/botoomNavigation/homePage/home.dart';
import 'package:real_state/page/botoomNavigation/profile/profileList.dart';
import 'package:real_state/page/botoomNavigation/profile/profilePage.dart';
import 'package:real_state/page/botoomNavigation/searchPage/searchPage.dart';
import 'package:real_state/service/service.dart';

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
      // getUser();

      _selectedItem = widget.index;
    });
  }

  getUser() async {
    await UserService().getUser().then((value) {
      print(value);
    });
  }

  // ignore: prefer_final_fields
  var _pageData = [
    HomeScreen(),
    SearchPage(status: false),
    FavouritPage(),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 5,
          child: Icon(
            Icons.add_circle_outline_sharp,
            size: 40,
            color: Color(0xffF44709),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddItemsPAge()));
            // AddItemsPAge();
            // Overlay.of(context).insert(entry);
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            // enableFeedback: false,
            iconSize: 25,
            selectedIconTheme:
                const IconThemeData(color: Color(0xffe75517), size: 30),
            unselectedItemColor: Color(0xffe75517),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                tooltip: "",
                icon: ImageIcon(AssetImage("assests/house-fill.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                tooltip: "",
                icon: ImageIcon(AssetImage("assests/search.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                tooltip: "",
                icon: ImageIcon(AssetImage("assests/search.png")),
                label: "",
              ),
              // BottomNavigationBarItem(
              //   tooltip: "",
              //   icon: Icon(Icons.add_circle_outline_outlined),
              //   label: "",
              // ),
              BottomNavigationBarItem(
                tooltip: "",
                icon: ImageIcon(AssetImage("assests/Repeat Grid 1.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                tooltip: "",
                icon: ImageIcon(AssetImage("assests/profile.png")),
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
        ),
      ),
    );
  }
}
