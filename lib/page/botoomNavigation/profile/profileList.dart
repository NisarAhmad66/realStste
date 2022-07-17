import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/profile/editButton.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  bool listbutton = false;
  bool bidButton = true;
  List list = [
    {"image": "assests/a.jpeg", "staus": "Active"},
    {"image": "assests/b.jpeg", "staus": "InActive"},
    {"image": "assests/c.jpeg", "staus": "InActive"},
    {"image": "assests/d.jpeg", "staus": "Active"},
    {"image": "assests/a.jpeg", "staus": "Active"},
    {"image": "assests/b.jpeg", "staus": "Active"},
  ];
  get initialIndex => 0;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  Widget listButton() {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex ?? 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelColor: Color(0xffce383a),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.grey,
              physics: BouncingScrollPhysics(),
              // indicator: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color: Color(0xffce383a)),
              tabs: [
                Tab(child: Icon(Icons.grid_on)),
                Tab(child: Icon(Icons.format_list_bulleted)),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              // color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6 - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),

              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: List.generate(
                              list.length,
                              (index) => Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 3, top: 3),
                                              height: 100,
                                              width: 100,
                                              // color: Colors.amber,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          list[index]
                                                              ["image"])),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            Text(list[index]["staus"]),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        bottom: 5,
                                        // right: 20,
                                        child: Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red),
                                        ),
                                      )
                                    ],
                                  )),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Wrap(
                              children: List.generate(
                            list.length,
                            (index) => Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.2 -
                                        40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(list[index]["image"])),
                                )),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bidButton() {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex ?? 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelColor: Color(0xffce383a),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.grey,
              physics: BouncingScrollPhysics(),
              // indicator: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color: Color(0xffce383a)),
              tabs: [
                Tab(child: Icon(Icons.grid_on)),
                Tab(child: Icon(Icons.format_list_bulleted)),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              // color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6 - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),

              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: List.generate(
                              list.length,
                              (index) => Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 3, top: 3),
                                              height: 100,
                                              width: 100,
                                              // color: Colors.amber,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          list[index]
                                                              ["image"])),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            // Text(list[index]["staus"]),
                                          ],
                                        ),
                                      ),
                                      // Positioned(
                                      //   left: 12,
                                      //   bottom: 5,
                                      //   // right: 20,
                                      //   child: Container(
                                      //     height: 8,
                                      //     width: 8,
                                      //     decoration: BoxDecoration(
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //         color: Colors.red),
                                      //   ),
                                      // )
                                    ],
                                  )),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Wrap(
                              children: List.generate(
                            list.length,
                            (index) => Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.2 -
                                        40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(list[index]["image"])),
                                )),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // foregroundColor: Colors.deepOrange,
      //   // shadowColor: Colors.deepOrange,
      //   // surfaceTintColor: Colors.deepOrange,
      //   leading: Icon(Icons.arrow_back_ios_new_sharp),
      //   backgroundColor: Color(0xffe75517),
      //   elevation: 0,
      //   toolbarHeight: 100,
      //   centerTitle: true,
      //   // title: Image.asset("assests/logo trans Pb.png"),
      //   actions: [
      //     // Stack(children: [
      //     //   Container(
      //     //       margin: EdgeInsets.only(top: 50, right: 10),
      //     //       child: Image.asset("assests/phone-square.png"))
      //     // ])
      //   ],
      //   // iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Stack(children: [
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
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  // Icons.arrow_back_ios_new_rounded,
                  // iconSize: 100,
                  color: Colors.white,
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
          top: 90,
          left: 130,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assests/circle-o-notch.png"),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage("assests/Ellipse 1.png"),
              radius: 40,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "M.ATEEB",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Isalamabad",
                    style: TextStyle(
                      color: Color(0xffe75517),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset("assests/Group 1609.png"),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          // bidButton = true;
                          listbutton = !listbutton;
                          bidButton = !bidButton;
                          if (listbutton == false && bidButton == true) {
                            listButton();

                            print("i am false list Butoon");
                          } else if (listbutton == true && bidButton == false) {
                            _bidButton();
                            print("i am else list buttton");
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.1 - 35,
                        width: width * 0.3 + 15,
                        decoration: BoxDecoration(
                            color:
                                listbutton ? Colors.white : Color(0xffe75517),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Listing",
                            style: TextStyle(
                                color: listbutton ? Colors.black : Colors.white,
                                fontSize: 18)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          // listbutton = false;
                          listbutton = !listbutton;
                          bidButton = !bidButton;

                          if (bidButton == false && listbutton == true) {
                            // print("this is false bid button");
                          } else if (bidButton == true && listbutton == false) {
                            print(" i am else bid Button");
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.1 - 35,
                        width: width * 0.3 + 15,
                        decoration: BoxDecoration(
                            color: bidButton ? Colors.white : Color(0xffe75517),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Open Bids",
                            style: TextStyle(
                                color: bidButton ? Colors.black : Colors.white,
                                fontSize: 18)),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      bidButton ? listButton() : _bidButton(),
                    ],
                  ),
                )

                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.,
                //   children: [
                //     Icon(
                //       Icons.facebook,
                //       color: Color(0xffe75517),
                //       size: 30,
                //     ),
                //     Icon(
                //       Icons.,
                //       color: Color(0xffe75517),
                //       size: 30,
                //     ),
                //     Icon(
                //       Icons.facebook,
                //       color: Color(0xffe75517),
                //       size: 30,
                //     ),
                //   ],
                // )
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
    }
  }
}
