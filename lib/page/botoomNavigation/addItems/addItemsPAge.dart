import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/service/service.dart';

class AddItemsPAge extends StatefulWidget {
  const AddItemsPAge({Key? key}) : super(key: key);

  @override
  State<AddItemsPAge> createState() => _AddItemsPAgeState();
}

class _AddItemsPAgeState extends State<AddItemsPAge> {
  bool loader = false;
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            // focusColor: Colors.black,

            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            hintText: 'Price..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
        controller: first,
        validator: (first) {
          if (first!.isEmpty) {
            return "Enter Price";
          }
          return null;
        },
      ),
    );
  }

  Widget _lasttName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 5),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        // obscureText: !_passwordVisible,
        decoration: InputDecoration(
            hoverColor: Colors.white,
            focusColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            hintText: 'Title..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
        controller: last,
        validator: (last) {
          if (last!.isEmpty) {
            return "Enter Title";
          }
          return null;
        },
      ),
    );
  }

  Widget _Email() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
        maxLines: 10,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        // obscureText: !_passwordVisible,
        decoration: InputDecoration(
            hoverColor: Colors.white,
            focusColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            hintText: 'Description..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
        controller: email,
        validator: (email) {
          if (email!.isEmpty) {
            return "Enter Description";
          }
          return null;
        },
      ),
    );
  }

  String? selectedValue = "Socities";
  String? societyValue = 'Society1';
  String? cityValue = 'Islamabad';
  var userId;
  List<String> items = [
    'Socities',
    'Home Owner',
    'Rental',
  ];
  List<String> cityitems = [
    'Lahore',
    'Islamabad',
    'Karachi',
  ];

  List<String> societyitems = [
    'Society1',
    'Society2',
    'Society3',
    'Society4',
  ];
  var user;
  @override
  void initState() {
    setState(() {
      getUser();
    });
    super.initState();
  }

  getUser() async {
    await UserService().getUser().then((value) {
      // print(value);
      userId = value["_id"];
      // print(userId);
      user = value;
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return loader
        ? Scaffold(
            body: Center(
              child: SpinKitFadingCircle(
                // duration: Duration(milliseconds: 10000),
                color: Colors.deepOrange,
                size: 50.0,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xffEBE9E8),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: Color(0xffe75517),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 100,
              centerTitle: true,
              title: Text(
                'Add Property Details',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),

              // iconTheme: IconThemeData(color: Colors.black),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: logInformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UPLOAD UPTO 10 PHOTOS',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        height: height * 0.2,
                        width: width,
                        decoration: BoxDecoration(
                            color: Color(0xfffac4ab),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.1 + 30,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Color(0xfff4ab89),
                            borderRadius:
                                new BorderRadius.all(Radius.elliptical(90, 60)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Add Images',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Choose Category*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          elevation: 0,
                          // disabledHint: Text(
                          //   "select Socity",
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          enableFeedback: false,
                          underline: Container(),
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 22,
                          value: selectedValue,
                          isExpanded: true,
                          items: items.map(BuildMenuItems).toList(),
                          onChanged: (value) {
                            setState(() {
                              this.selectedValue = value;
                              print(selectedValue);
                            });
                          },
                        ),
                      ),
                      selectedValue == "Socities"
                          ? Text(
                              'Add Society*',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            )
                          : Container(),
                      selectedValue == "Socities"
                          ? Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton<String>(
                                elevation: 0,
                                enableFeedback: false,
                                underline: Container(),
                                icon: Icon(Icons.keyboard_arrow_down_rounded),
                                iconSize: 22,
                                value: societyValue,
                                isExpanded: true,
                                items: societyitems.map(BuildSociety).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    this.societyValue = value;
                                    print(societyValue);
                                  });
                                },
                              ),
                            )
                          : Container(),
                      Text(
                        'Choose City*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          elevation: 0,
                          enableFeedback: false,
                          underline: Container(),
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 22,
                          value: cityValue,
                          isExpanded: true,
                          items: cityitems.map(BuildCity).toList(),
                          onChanged: (value) {
                            setState(() {
                              this.cityValue = value;
                              print(cityValue);
                            });
                          },
                        ),
                      ),
                      Text(
                        'Price*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      _firstName(),
                      Text(
                        'Title*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      _lasttName(),
                      Text(
                        'Description*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      _Email(),
                      loader
                          ? SpinKitFadingCircle(
                              // duration: Duration(milliseconds: 10000),
                              color: Colors.deepOrange,
                              size: 50.0,
                            )
                          : RawMaterialButton(
                              onPressed: () {
                                if (logInformKey.currentState!.validate()) {
                                  addPost();
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 15, bottom: 15),
                                  alignment: Alignment.center,
                                  height: height * 0.1 - 30,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Post Now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                    ],
                  ),
                ),
              ),
            ));
  }

  Future opengallery(BuildContext context, ImageSource source) async {
    final image =
        await ImagePicker().getImage(source: source, imageQuality: 10);

    // if (image != null) {
    //   setState(() {
    //     img1 = File(image.path);
    //     List imageList = [img1];
    //     uploadImage(imageList);
    //   });
    // }
  }

  addPost() async {
    Map data = {
      "category": selectedValue.toString(),
      "society": societyValue.toString(),
      "city": cityValue.toString(),
      "price": first.text,
      "title": last.text,
      "description": email.text,
      "userID": userId.toString(),
    };
    setState(() {
      loader = true;
    });
    print(data);
    await UserService().postApi("/posts/create", data).then((value) {
      print(value);
      if (value["success"] == true) {
        setState(() {
          user["Coins"] = user["Coins"] - 3;
          UserService().setUser(user).then((value) {
            print(value);
          });
        });
        // showMessage(context, "Posted For Admin Approval!");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Mall(index: 0)),
            (route) => false);
      } else if (value["message"] == "User have less then 3 coins") {
        setState(() {
          loader = false;
          showMessage(context, value["message"].toString());
          first.clear();
          last.clear();
          email.clear();
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => Mall(index: 0)),
          //     (route) => false);
        });
      } else {
        setState(() {
          loader = false;
        });
        showMessage(context, value["message"].toString());
      }
    });
  }

  DropdownMenuItem<String> BuildMenuItems(String items) => DropdownMenuItem(
        value: items,
        child: Text(items),
      );
  DropdownMenuItem<String> BuildSociety(String societyitems) =>
      DropdownMenuItem(
        value: societyitems,
        child: Text(societyitems),
      );
  DropdownMenuItem<String> BuildCity(String cityitems) => DropdownMenuItem(
        value: cityitems,
        child: Text(cityitems),
      );
  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
