import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:real_state/page/botoomNavigation/homePage/filter.dart';
import 'package:real_state/page/botoomNavigation/homePage/listDetails.dart';
import 'package:real_state/service/service.dart';

class Listing extends StatefulWidget {
  var endPoint;
  Listing({Key? key, this.endPoint}) : super(key: key);

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  bool owner = false;
  bool society = false;
  bool rental = true;
  double currentvol = 0.5;
  RangeValues sliderRange = RangeValues(10, 100);
  List categoryList = [
    {"name": "Owner", "status": false},
    {"name": "Rental", "status": true},
    {"name": "Socities", "status": false},
  ];
  List<bool> isSelected = [true, false, false];
  List Society = [
    {"name": "Society1"},
    {"name": "Society2"},
    {"name": "Society3"},
    {"name": "Society4"},
    {"name": "Society5"},
    {"name": "Society6"},
  ];
  List city = [
    {"name": "Islamabad"},
    {"name": "Lahore"},
    {"name": "Wah Cantt"},
    {"name": "Faisalabad"},
    {"name": "Sarghoda"},
    {"name": "ShorCot"},
  ];
  List list = [
    {
      "image": "assests/a.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/b.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/c.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/d.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/a.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/b.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
  ];
  List socitiesPost = [];
  bool loader = false;
  @override
  void initState() {
    setState(() {
      getData();
      // print(widget.endPoint);
    });
    super.initState();
  }

  getData() async {
    setState(() {
      loader = true;
    });
    await UserService().getApi(widget.endPoint.toString()).then((value) {
      print(value);
      if (value["success"] == true) {
        socitiesPost = value["Response"];
      }
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Back',
                style: TextStyle(
                    color: Color(0xffe75517),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "Listings",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  // filter();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                });
              },
              child: Image.asset(
                'assests/filter icon.png',
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: loader
          ? SpinKitFadingCircle(
              // duration: Duration(milliseconds: 10000),
              color: Colors.deepOrange,
              size: 50.0,
            )
          : socitiesPost == null || socitiesPost.length == 0
              ? Center(
                  child: Text("There is post Avabile"),
                )
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assests/buildings.png"))),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          children: List.generate(
                              socitiesPost.length,
                              (index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListDetails(
                                                    itemDetails:
                                                        socitiesPost[index],
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 10,
                                      color: Color(0xfffac4aa),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Container(
                                          height: height * 0.2 - 25,
                                          width: width,
                                          decoration: BoxDecoration(
                                              // color: Color(0xfffac4aa),
                                              // borderRadius: BorderRadius.circular(50)
                                              ),
                                          child: Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    height: height * 0.1 + 30,
                                                    width: width * 0.3 + 15,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.black,
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                list[index]
                                                                    ["image"])),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          socitiesPost[index]
                                                              ["Title"],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  right: 0,
                                                                  top: 10),
                                                          child: Container(
                                                            height: 90,
                                                            width: 180,
                                                            child: Text(
                                                              socitiesPost[
                                                                      index][
                                                                  "Description"],
                                                              // strutStyle: ,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                              maxLines: 4,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Positioned(
                                                right: 25,
                                                top: 10,
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ],
                ),
    );
  }

  filter() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        // isScrollControlled: true,
        context: context,
        builder: (context) => DraggableScrollableSheet(

            // maxChildSize: 1,
            initialChildSize: 0.5,
            // maxChildSize: 1,
            builder: (_, controller) => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  color: Color(0xfffac4ab),
                  child: ListView(
                    controller: controller,
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    color: Color(0xffe75517),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 15,
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                color: Color(0xffe75517),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                            child: Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffe75517),
                          ),
                        )),
                      ),

                      // ToggleButtons(
                      //     verticalDirection: VerticalDirection.up,
                      //     textStyle: TextStyle(color: Colors.white),
                      //     children: [
                      //       Text("Rental "),
                      //       Text("Owner "),
                      //       Text("Socities "),
                      //     ],
                      //     isSelected: isSelected),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              categoryList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        rental = !rental;
                                        owner = !owner;
                                        society = !society;
                                        // print(rental);
                                        //   if (categoryList[index]["name"] ==
                                        //       "Rental") {
                                        //     rental == true;
                                        //     owner == false;
                                        //     society = false;
                                        //   } else if (categoryList[index]
                                        //           ["name"] ==
                                        //       "Owner") {
                                        //     rental == false;
                                        //     owner == true;
                                        //     society = false;
                                        //   } else {
                                        //     rental == false;
                                        //     owner == false;
                                        //     society = true;
                                        //   }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          bottom: 30,
                                          top: 10,
                                          left: 20,
                                          right: 20),
                                      height:
                                          MediaQuery.of(context).size.height *
                                                  0.1 -
                                              40,
                                      width: MediaQuery.of(context).size.width *
                                              0.2 +
                                          25,
                                      decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.elliptical(30, 45)),
                                        color: rental == true
                                            ? Color(0xffe75517)
                                            : society == true
                                                ? Color(0xffe75517)
                                                : owner == true
                                                    ? Color(0xffe75517)
                                                    : Colors.black,
                                      ),
                                      child: Text(
                                        categoryList[index]["name"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Select Society",
                                style: TextStyle(
                                  color: Color(0xffe75517),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 15,
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Color(0xffe75517),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              Society.length,
                              (index) => Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        bottom: 30, top: 10, left: 5, right: 5),
                                    height: MediaQuery.of(context).size.height *
                                            0.1 -
                                        40,
                                    width: MediaQuery.of(context).size.width *
                                            0.2 +
                                        25,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          Radius.elliptical(30, 45)),
                                      color: Color(0xffe75517),
                                    ),
                                    child: Text(
                                      Society[index]["name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                        ),
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Select City",
                                style: TextStyle(
                                  color: Color(0xffe75517),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 15,
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Color(0xffe75517),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              city.length,
                              (index) => Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        bottom: 30, top: 10, left: 5, right: 5),
                                    height: MediaQuery.of(context).size.height *
                                            0.1 -
                                        40,
                                    width: MediaQuery.of(context).size.width *
                                            0.2 +
                                        25,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          Radius.elliptical(30, 45)),
                                      color: Color(0xffe75517),
                                    ),
                                    child: Text(
                                      city[index]["name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              color: Color(0xffe75517),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      RangeSlider(
                          values: sliderRange,
                          // activeColor: Color(0xffe75517),
                          // inactiveColor: Colors.white,
                          min: 1,
                          max: 100,
                          divisions: 10,
                          onChanged: (newValue) {
                            setState(() {
                              sliderRange = newValue;
                              print(sliderRange);
                            });
                          })
                    ],
                  ),
                )));
  }
}
