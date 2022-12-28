import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:real_state/page/botoomNavigation/profile/editButton.dart';
import 'package:real_state/page/splash.dart';
import 'package:real_state/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Coins extends StatefulWidget {
  const Coins({Key? key}) : super(key: key);

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  List list = [
    {
      "points": "20 Points",
      "name": "Basic",
      "price": "300 PKR",
    },
    {
      "points": "20 Points",
      "name": "Standard",
      "price": "300 PKR",
    },
    {
      "points": "20 Points",
      "name": "Premium",
      "price": "300 PKR",
    },
  ];
  bool loader = false;
  var user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print("i am here");
      getUser();
    });
  }

  getUser() async {
    setState(() {
      loader = true;
    });
    await UserService().getUser().then((value) {
      print(value);
      user = value;
      // print(user["LastName"]);
    });
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      body: loader
          ? SpinKitFadingCircle(
              // duration: Duration(milliseconds: 10000),
              color: Colors.deepOrange,
              size: 50.0,
            )
          : Stack(children: [
              Container(
                // alignment: Alignment.center,
                height: height * 0.2 - 30,
                width: width,
                decoration: BoxDecoration(color: Color(0xffe75517)),
                child: Stack(children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        print("object");
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 0,
                    child: PopupMenuButton<int>(
                      icon: Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Color(0xffe75517)),
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Text(
                            'Settings',
                            style: TextStyle(color: Color(0xffe75517)),
                          ),
                        ),
                        PopupMenuDivider(),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: [
                              Text(
                                'Sign Out',
                                style: TextStyle(color: Color(0xffe75517)),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.logout,
                                color: Color(0xffe75517),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Positioned(
                top: 40,
                left: 120,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xffEBE9E8),
                  backgroundImage: AssetImage("assests/circle-o-notch.png"),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffEBE9E8),
                    child: Image.asset(
                      "assests/Points.png",
                      fit: BoxFit.cover,
                    ),
                    radius: 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 170,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        user["Coins"].toString() + " points",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              list.length,
                              (index) => Container(
                                height: height * 0.45,
                                width: width * 0.42,
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assests/asset-1.png"))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Text(
                                        list[index]["points"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff9b680e)),
                                      ),
                                    ),
                                    Text(
                                      list[index]["name"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 35),
                                      child: Text(
                                        list[index]["price"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 140, left: 140),
                          child: RichText(
                            text: TextSpan(
                                text: "Amount ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "PKR 100 ",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "(20 Points)",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ]),
                          )),
                      RawMaterialButton(
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            height: height * 0.1 - 30,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Color(0xfff44709),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Payment",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditButton()),
        );
        break;
      case 1:
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => SharePage()),
        // );
        break;
      case 2:
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        //   (route) => false,
        // );
        logOut();
        break;
    }
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (route) => false);
  }
}
