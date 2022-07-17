import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/profile/editButton.dart';
import 'package:real_state/page/botoomNavigation/profile/notifications.dart';
import 'package:real_state/widget/change_theme_button_widget.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List list = [
    {
      "icon": "assests/setting acc.png",
      "title": "Accounts",
      "sub": "Manage Your profie details"
    },
    {
      "icon": "assests/noticication.png",
      "title": "Notifications",
      "sub": "Enable or Disable Notification"
    },
    {
      "icon": "assests/genral setting.png",
      "title": "General",
      "sub": "List out all setting options"
    },
    {
      "icon": "assests/helpicon.png",
      "title": "Help & FAQs",
      "sub": "Read aboout us"
    },
    {
      "icon": "assests/setting support (1).png",
      "title": "Customer Support",
      "sub": "24/7 support"
    },
    {"icon": "assests/about.png", "title": "About", "sub": "Know about us"},
    {
      "icon": "assests/verions.png",
      "title": "Version",
      "sub": "Check version details"
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: CircleAvatar(
              // backgroundImage: ExactAssetImage(""),
              radius: 25,
              child: Image.asset("assests/Ellipse 1.png"),
            ),
          ),
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 40),
                  height: height * 0.1 + 10,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border(
                      // top: BorderSide(
                      //     width: 16.0, color: Colors.lightBlue.shade600),
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Dark/Light",
                            style: TextStyle(
                              fontSize: 26,
                              color: Color(0xffe75517),
                            ),
                          ),
                        ),
                        ChangeThemeButtonWidget()
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Column(
                    children: List.generate(
                        list.length,
                        (index) => InkWell(
                              onTap: () {
                                if (list[index]["title"] == "Accounts") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditButton()));
                                } else if (list[index]["title"] ==
                                    "Notifications") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Notifications()));
                                }
                              },
                              child: Container(
                                // alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                height: height * 0.1 + 20,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xfffac4aa),
                                ),
                                child: Stack(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        child: Image.asset(list[index]["icon"]),
                                      ),
                                    ),
                                    Positioned(
                                      left: 100,
                                      // top: ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              list[index]["title"],
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffe75517)),
                                            ),
                                            Text(
                                              list[index]["sub"],
                                              style: TextStyle(
                                                  color: Color(0xffe75517)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 35,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey.shade700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
