import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/page/otp/verififyOtp.dart';
import 'package:real_state/service/service.dart';

class OtpCode extends StatefulWidget {
  final String Name;
  final String LastName;
  final String Email;
  // final String Phone;
  // final String Address;
  // final String Confirm;
  final String Password;
  // final String countryCode;
  OtpCode(
      {Key? key,
      required this.Name,
      required this.LastName,
      // required this.Address,
      required this.Email,
      required this.Password})
      : super(key: key);

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  String suffix = "";
  int? phone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print(widget.Name);
      print(widget.Email);
      print(widget.Password);
    });
  }

  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        onChanged: (first) {
          setState(() {
            first = first;
            print(first.length);
            phone = first.length;
          });
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),

            // prefix: ,
            // prefixText: "+92",
            prefix: Text(
              "+92         ",
              style: TextStyle(color: Colors.black),
            ),
            // prefixIcon: Text(
            //   "+92",
            //   style: TextStyle(color: Colors.black),
            // ),
            // suffix: ,

            suffixIcon: phone == 10
                ? Image.asset(
                    "assests/Group -1.png",
                    height: 20,
                    width: 20,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            // hintText: 'First Name..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Color(0xfff5f5f5),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: first,
        validator: (first) {
          if (first!.isEmpty) {
            return "Enter Phone";
          } else if (first.length < 10 && first.toString()[0] != 3) {
            return "Enter a Valid Number";
          }
          return null;
        },
      ),
    );
  }

  bool loader = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      body: SingleChildScrollView(
        child: Form(
          key: logInformKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset("assests/size.png", height: 100, width: 200),
              Image.asset(
                "assests/Group 260.png",
                height: 150,
                width: 250,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                height: height * 0.3 - 15,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      _firstName(),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 10),
                        child: loader
                            ? SpinKitFadingCircle(
                                // duration: Duration(milliseconds: 10000),
                                color: Colors.deepOrange,
                                size: 50.0,
                              )
                            : RawMaterialButton(
                                onPressed: () {
                                  if (logInformKey.currentState!.validate() &&
                                      first.text.toString()[0] == "3" &&
                                      first.text.length == 10) {
                                    checkNumber();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyUserOTPScreen(
                                    //               Name: widget.Name,
                                    //               Email: widget.Email,
                                    //               Password: widget.Password,
                                    //               Phone: first.text,
                                    //             )));
                                  } else {
                                    showMessage(
                                        context, "please enter a valid Phone!");
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.only(),
                                    alignment: Alignment.center,
                                    height: height * 0.1 - 30,
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkNumber() async {
    setState(() {
      loader = true;
    });
    Map data = {"number": "+92" + first.text};
    await UserService().postApi("/user/phoneCheck", data).then((value) {
      print(value);
      if (value["message"] == "This Phone Number is not exists") {
        print("I am here");
        setState(() {
          loader = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyUserOTPScreen(
                      Name: widget.Name,
                      LastName: widget.LastName,
                      Email: widget.Email,
                      Password: widget.Password,
                      Phone: first.text,
                    )));
      } else {
        setState(() {
          loader = false;
        });
        showMessage(context, "This Number is Already have an account ");
      }
    });
  }

  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
