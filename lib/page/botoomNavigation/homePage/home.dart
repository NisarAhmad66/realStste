import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:real_state/page/botoomNavigation/profile/listing.dart';
import 'package:real_state/page/botoomNavigation/profile/profilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [
    {"name": "SOCITIES", "image": "assests/1.png"},
    {"name": "OWNERS", "image": "assests/2.png"},
    {"name": "RENTAL", "image": "assests/3.png"},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Image.asset(
            "assests/align-left.png",
            height: 15,
            width: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 140,
        centerTitle: true,
        title: Image.asset("assests/logo trans Pb.png"),
        actions: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 50, right: 10),
                child: Image.asset("assests/phone-square.png"))
          ])
        ],
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assests/buildings.png"))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    list.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Listing()));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 20, right: 40, left: 40),
                            height: height * 0.2,
                            width: width,
                            decoration: BoxDecoration(
                                color: Color(0xffe75517),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, right: 5, left: 5, bottom: 20),
                                  height: height * 0.1 + 20,
                                  // color: Colors.black,
                                  decoration: BoxDecoration(
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
