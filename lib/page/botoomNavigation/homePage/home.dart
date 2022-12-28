import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/profile/listing.dart';
import 'package:real_state/page/botoomNavigation/profile/profilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [
    {"name": "SOCITIES", "image": "assests/3.png"},
    {"name": "OWNERS", "image": "assests/2.png"},
    {"name": "RENTAL", "image": "assests/1.png"},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            // child: Container(
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           // fit: BoxFit.cover,
            //           image: AssetImage("assests/align-left.png"))),
            //   // child: Image.asset(
            //   //   "assests/align-left.png",
            //   //   height: 1,
            //   //   width: 1,
            //   // ),
            // ),
            child: Image.asset(
              "assests/align-left.png",
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Image.asset("assests/size.png", height: 100, width: 170),
        actions: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 35, right: 10),
                child: Image.asset(
                  "assests/phone-square.png",
                  height: 35,
                  width: 35,
                ))
          ])
        ],
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, right: 1, left: 1),
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assests/buildings.png"))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    list.length,
                    (index) => InkWell(
                          onTap: () {
                            if (list[index]["name"] == "SOCITIES") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Listing(
                                            endPoint: "/posts/society",
                                          )));
                            } else if (list[index]["name"] == "OWNERS") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Listing(
                                            endPoint: "/posts/homeOwner",
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Listing(
                                            endPoint: "/posts/rental",
                                          )));
                            }
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 30, right: 40, left: 40),
                            height: height * 0.2 - 5,
                            width: width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: Color(0xffe75517),
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, right: 5, left: 5, bottom: 15),
                                  height: height * 0.1 + 20,
                                  // color: Colors.black,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 0.1,
                                          blurRadius: 0.1,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage(list[index]["image"])),
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Text(
                                  list[index]["name"],
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = new Path();
//     path.lineTo(size.width, 20);
//     var controllPointer = Offset(30, size.height);
//     var endpoint = Offset(size.width, size.height);
//     path.quadraticBezierTo(
//         controllPointer.dx, controllPointer.dy, endpoint.dx, endpoint.dy);
//     path.lineTo(size.width, size.height);
//     // path.lineTo(size.width * 3, size.height - 50);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }
