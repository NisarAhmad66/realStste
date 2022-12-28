import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/homePage/cityFilter.dart';
import 'package:real_state/page/botoomNavigation/homePage/societyFilter.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  Widget _firstName() {
    return TextFormField(
        keyboardType: TextInputType.number,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            // focusColor: Colors.black,

            contentPadding: const EdgeInsets.only(
              left: 5,
            ),
            hintText: 'Start..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
        controller: first,
        validator: MinLengthValidator(3,
            errorText: "Password must be more then 3 words"));
  }

  Widget _lasttName() {
    return TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        // obscureText: !_passwordVisible,
        decoration: InputDecoration(
            // enabledBorder: InputBorder.none,
            // suffixIcon: InkWell(
            //   onTap: () {
            //     setState(() {
            //       _passwordVisible = !_passwordVisible;
            //     });
            //   },
            //   child: Icon(
            //     Icons.remove_red_eye,
            //     color: _passwordVisible ? Colors.blue : Colors.black,
            //   ),
            // ),
            hoverColor: Colors.white,
            focusColor: Colors.white,
            contentPadding: const EdgeInsets.only(
              left: 5,
            ),
            hintText: 'End..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: last,
        validator: MinLengthValidator(3,
            errorText: "Password must be more then 3 words"));
  }

  bool? owner;
  bool? society = true;
  bool? rental;
  bool? society1;
  bool? society2 = true;
  bool? society3;
  bool? society4;

  bool? isb = true;
  bool? lhr;
  bool? fsd;
  double currentvol = 0.5;
  RangeValues sliderRange = RangeValues(2500000, 100000000);
  RangeLabels labels = RangeLabels("2500000", "100000000");
  String selectCoty = "Socities";
  List categoryList = [
    {"name": "Owner", "status": false},
    {"name": "Rental", "status": false},
    {"name": "Socities", "status": true},
  ];
  List<bool> isSelected = [true, false, false];
  List Society = [
    {"name": "Society1"},
    {"name": "Society2"},
    {"name": "Society3"},
    {"name": "Society4"},
  ];
  List city = [
    {"name": "Islamabad"},
    {"name": "Lahore"},
    {"name": "Faisalabad"},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color(0xfffac4ab),
      body: Container(
        // margin: EdgeInsets.only(top: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        color: Color(0xfffac4ab),
        child: SingleChildScrollView(
          child: Column(
            // controller: controller,
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
                                if (categoryList[index]["name"] == "Rental") {
                                  rental = true;
                                  owner = false;
                                  society = false;
                                } else if (categoryList[index]["name"] ==
                                    "Owner") {
                                  // selectCoty = 'Owner';
                                  rental = false;
                                  owner = true;
                                  society = false;
                                  print(owner);
                                } else {
                                  rental = false;
                                  owner = false;
                                  society = true;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  bottom: 30, top: 10, left: 20, right: 20),
                              height:
                                  MediaQuery.of(context).size.height * 0.1 - 40,
                              width:
                                  MediaQuery.of(context).size.width * 0.2 + 25,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      Radius.elliptical(30, 45)),
                                  color:
                                      categoryList[index]["name"] == "Rental" &&
                                              rental == true
                                          ? Color(0xffe75517)
                                          : categoryList[index]["name"] ==
                                                      "Owner" &&
                                                  owner == true
                                              ? Color(0xffe75517)
                                              : categoryList[index]["name"] ==
                                                          "Socities" &&
                                                      society == true
                                                  ? Color(0xffe75517)
                                                  : Color.fromARGB(
                                                      255, 238, 125, 83)),
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
              society == true
                  ? Stack(
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SocietyFilter()));
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Color(0xffe75517),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              society == true
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            Society.length,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (Society[index]["name"] ==
                                          "Society1") {
                                        society1 = true;
                                        society2 = false;
                                        society3 = false;
                                        society4 = false;
                                      } else if (Society[index]["name"] ==
                                          "Society2") {
                                        society1 = false;
                                        society2 = true;
                                        society3 = false;
                                        society4 = false;
                                      } else if (Society[index]["name"] ==
                                          "Society3") {
                                        society1 = false;
                                        society2 = false;
                                        society3 = true;
                                        society4 = false;
                                      } else {
                                        society1 = false;
                                        society2 = false;
                                        society3 = false;
                                        society4 = true;
                                      }
                                    });
                                  },
                                  child: Container(
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
                                      color: Society[index]["name"] ==
                                                  "Society1" &&
                                              society1 == true
                                          ? Color(0xffe75517)
                                          : Society[index]["name"] ==
                                                      "Society2" &&
                                                  society2 == true
                                              ? Color(0xffe75517)
                                              : Society[index]["name"] ==
                                                          "Society3" &&
                                                      society3 == true
                                                  ? Color(0xffe75517)
                                                  : Society[index]["name"] ==
                                                              "Society4" &&
                                                          society4 == true
                                                      ? Color(0xffe75517)
                                                      : Color.fromARGB(
                                                          255, 238, 125, 83),
                                    ),
                                    child: Text(
                                      Society[index]["name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )),
                      ),
                    )
                  : Container(),
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityFilter()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Color(0xffe75517),
                        ),
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
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                if (city[index]["name"] == "Islamabad") {
                                  isb = true;
                                  fsd = false;
                                  lhr = false;
                                } else if (city[index]["name"] == "Lahore") {
                                  isb = false;
                                  fsd = false;
                                  lhr = true;
                                } else if (city[index]["name"] ==
                                    "Faisalabad") {
                                  isb = false;
                                  fsd = true;
                                  lhr = false;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  bottom: 30, top: 10, left: 5, right: 5),
                              height:
                                  MediaQuery.of(context).size.height * 0.1 - 40,
                              width:
                                  MediaQuery.of(context).size.width * 0.2 + 25,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                    Radius.elliptical(30, 45)),
                                color: city[index]["name"] == "Islamabad" &&
                                        isb == true
                                    ? Color(0xffe75517)
                                    : city[index]["name"] == "Lahore" &&
                                            lhr == true
                                        ? Color(0xffe75517)
                                        : city[index]["name"] == "Faisalabad" &&
                                                fsd == true
                                            ? Color(0xffe75517)
                                            : Color.fromARGB(255, 238, 125, 83),
                              ),
                              child: Text(
                                city[index]["name"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
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

              // RangeSlider(
              //     values: sliderRange,
              //     activeColor: Color(0xffe75517),
              //     inactiveColor: Colors.white,
              //     min: 200000,
              //     max: 200000000,
              //     divisions: 10,
              //     // labels: labels,
              //     onChanged: (newValue) {
              //       setState(() {
              //         sliderRange = newValue;
              //         labels = RangeLabels(sliderRange.start.toString(),
              //             sliderRange.end.toString());
              //         print(sliderRange);
              //       });
              //     }),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         sliderRange.start.toInt().toString(),
              //         style: TextStyle(
              //             color: Color(0xffe75517),
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600),
              //       ),
              //       Text(
              //         sliderRange.end.toInt().toString(),
              //         style: TextStyle(
              //             color: Color(0xffe75517),
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: height * 0.1 - 40,
                    width: width * 0.2 + 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: _firstName(),
                  ),
                  Text(
                    "to",
                    style: TextStyle(
                        color: Color(0xffe75517),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: height * 0.1 - 40,
                    width: width * 0.2 + 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: _lasttName(),
                  ),
                ],
              ),
              RawMaterialButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Mall(
                  //               index: 0,
                  //             )));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    alignment: Alignment.center,
                    height: height * 0.1 - 30,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Apply Now",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
