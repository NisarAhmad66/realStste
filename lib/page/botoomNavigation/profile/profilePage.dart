import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:real_state/page/botoomNavigation/profile/contactUs.dart';
import 'package:real_state/page/botoomNavigation/profile/listing.dart';
import 'package:real_state/page/botoomNavigation/profile/profileList.dart';
import 'package:real_state/page/botoomNavigation/profile/setting.dart';
import 'package:real_state/page/signUp/loginScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assests/Group 37.png")],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: height * 0.2 + 10,
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage("assests/Ellipse 1.png"),
                      radius: 40,
                      child: Stack(children: [
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.add_circle_sharp,
                              color: Color(0xffe75517),
                            )),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 80),
                    child: Text(
                      "M.ATEEB",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height * 0.3 + 40,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          children: [
                            Image.asset(
                              "assests/profile.png",
                              height: 30,
                              width: 25,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text("Profile",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    // color: Colors.black.withOpacity(0.5)
                                  )),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Listing()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        // height: 45,
                        decoration: BoxDecoration(),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assests/list.png",
                              height: 30,
                              width: 25,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text("Listing",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    // color: Colors.black.withOpacity(0.5)
                                  )),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Setting()));
                      },
                      child: Container(
                        // height: 45,

                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assests/settings.png",
                              height: 30,
                              width: 25,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text("Setting",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    // color: Colors.black.withOpacity(0.5)
                                  )),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUs()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        // height: 45,
                        decoration: BoxDecoration(),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assests/iconss.png",
                              height: 30,
                              width: 25,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text("Contact Us",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    // color: Colors.black.withOpacity(0.5)
                                  )),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        // height: 45,
                        decoration: BoxDecoration(),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assests/about-circle-outline.png",
                              height: 30,
                              width: 25,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text("About Us",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    // color: Colors.black.withOpacity(0.5)
                                  )),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 15, right: 25, left: 25),
                // height: 45,
                decoration: BoxDecoration(),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assests/support icon.png",
                      height: 30,
                      width: 25,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text("Customer Support",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 16,
                            // color: Colors.black.withOpacity(0.5)
                          )),
                    )),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 15, right: 25, left: 25),
                // height: 45,
                decoration: BoxDecoration(),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assests/help.png",
                      height: 30,
                      width: 25,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text("Help & Faqs",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 16,
                            // color: Colors.black.withOpacity(0.5)
                          )),
                    )),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
