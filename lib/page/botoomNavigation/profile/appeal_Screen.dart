import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/service/service.dart';

class Appeal extends StatefulWidget {
  var postId;
  Appeal({Key? key, this.postId}) : super(key: key);

  @override
  State<Appeal> createState() => _AppealState();
}

class _AppealState extends State<Appeal> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            // focusColor: Colors.black,

            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            hintText: 'Subject',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white.withOpacity(0.7),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: first,
        validator: (first) {
          if (first!.isEmpty) {
            return "Enter Subject";
          }

          return null;
        },
      ),
    );
  }

  Widget _lasttName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 40),
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
            fillColor: Colors.white.withOpacity(0.7),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
        controller: last,
        validator: (last) {
          if (last!.isEmpty) {
            return "Enter Description";
          }
          return null;
        },
      ),
    );
  }

  bool loader = false;
  @override
  void initState() {
    setState(() {
      print(widget.postId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Color(0xffEBE9E8),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Text(
                  "Back",
                  style: TextStyle(
                      color: Color(0xffe75517),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            "Appeal",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xffe75517)),
          ),

          // iconTheme: IconThemeData(color: Colors.black),
        ),
        body: loader
            ? Center(
                child: SpinKitFadingCircle(
                  // duration: Duration(milliseconds: 10000),
                  color: Colors.deepOrange,
                  size: 50.0,
                ),
              )
            : Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xffebe9e8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Form(
                      key: logInformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subject",
                            style: TextStyle(fontSize: 18),
                          ),
                          _firstName(),
                          Text(
                            "Description",
                            style: TextStyle(fontSize: 18),
                          ),
                          _lasttName(),
                          Center(
                            child: RawMaterialButton(
                              onPressed: () {
                                if (logInformKey.currentState!.validate()) {
                                  appeal();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                decoration: BoxDecoration(
                                  color: Color(0xffe75517),
                                  borderRadius: new BorderRadius.all(
                                      Radius.elliptical(20, 45)),
                                ),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }

  appeal() async {
    setState(() {
      loader = true;
    });
    Map data = {"subject": first.text, "description": last.text};
    await UserService()
        .postApi("/posts/appeald/" + widget.postId, data)
        .then((value) {
      print(value);
      if (value["success"] == true) {
        setState(() {
          loader = false;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Mall(index: 4)),
            (route) => false);
      } else {
        setState(() {
          loader = false;
          showMessage(context, value["message"].toString());
        });
      }
    });
  }

  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
