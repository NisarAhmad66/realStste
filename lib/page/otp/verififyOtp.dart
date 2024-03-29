import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/service/service.dart';

class MyUserOTPScreen extends StatefulWidget {
  final String Name;
  final String LastName;
  final String Email;
  final String Phone;
  final String Password;
  MyUserOTPScreen({
    Key? key,
    required this.Name,
    required this.LastName,
    required this.Email,
    required this.Phone,
    // required this.countryCode,
    // required this.Confirm,
    // required this.Address,
    required this.Password,
  });

  @override
  _MyUserOTPScreenState createState() => _MyUserOTPScreenState();
}

class _MyUserOTPScreenState extends State<MyUserOTPScreen> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String _verificationCode;
  int _resendToken = 0;
  bool isButtonEnabled = false;
  bool showSpinner = false;
  bool showResend = false;
  bool loaderindicator = false;
  CountDownController controller = CountDownController();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.grey,
    ),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? verId;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Container(
                  //   height: 100,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //       // color: Colors.black,
                  //       image: DecorationImage(
                  //           fit: BoxFit.fill,
                  //           image: AssetImage("assests/size.png"))),
                  // ),
                  Image.asset(
                    "assests/size.png",
                    height: 100,
                    width: 200,
                  ),

                  Text(
                    "Enter Code",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "* * * * *",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffe75517)),
                    ),
                  ),
                  Text(
                    "We have sent you an SMS on +92" + widget.Phone.toString(),
                    style: TextStyle(
                        // color: Color(0xff3e5d9d),
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "with 6 digits verification code.",
                    style: TextStyle(
                        // color: Color(0xff3e5d9d),
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "Please check your mobile number ",
                  //   style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  // ),
                  // Text(
                  //   "continue to SignUp",
                  //   style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.2,
                    width: width,
                    padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                    // margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        color: Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Pinput(
                      obscureText: true,
                      obscuringCharacter: "*",
                      // withCursor: true,
                      length: 6,

                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsRetrieverApi,
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.grey.shade300))),
                      ),

                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      onCompleted: (pin) async {
                        setState(() {
                          // loaderindicator = true;
                        });
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _verificationCode,
                                      smsCode: pin))
                              .then((value) async {
                            print(value);
                            if (value.user != null) {
                              print("that is a valid code");
                              createuser();

                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Mall(
                              //               index: 0,
                              //             )),
                              //     (route) => false);
                            }
                          });

                          setState(() {
                            loaderindicator = false;
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          // ignore: deprecated_member_use
                          // _scaffoldKey.currentState!.showSnackBar(
                          //     SnackBar(content: Text('Invalid OTP')));
                        }
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 30, bottom: 10, right: 20, left: 20),
                  //   child: RawMaterialButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => Mall(
                  //                     index: 0,
                  //                   )));
                  //     },
                  //     child: Container(
                  //         margin: EdgeInsets.only(),
                  //         alignment: Alignment.center,
                  //         height: height * 0.1 - 30,
                  //         width: width,
                  //         decoration: BoxDecoration(
                  //             color: Colors.deepOrange,
                  //             borderRadius: BorderRadius.circular(30)),
                  //         child: Text(
                  //           "Submit",
                  //           style: TextStyle(
                  //               fontSize: 16,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //         )),
                  //   ),
                  // ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: showResend
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Did not receive the code? "),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: (() async {
                                        await _verifyPhone();
                                        setState(() {
                                          showResend = false;
                                          controller.restart(duration: 60);
                                        });

                                        SnackBar(content: Text("Code resent"));
                                      }),
                                      child: Text(
                                        "Re-send?",
                                        style:
                                            TextStyle(color: Color(0xffe75517)),
                                      ),
                                    ),
                                    Text(
                                      "Get a call now?",
                                      style: TextStyle(
                                          color: Color(0xffe75517),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : CircularCountDownTimer(
                              width: MediaQuery.of(context).size.height * 0.08,
                              height: MediaQuery.of(context).size.height * 0.08,
                              duration: 60,
                              isReverse: true,
                              controller: controller,
                              isReverseAnimation: true,
                              onComplete: () {
                                setState(() {
                                  showResend = true;
                                });
                              },
                              fillColor: Colors.white,
                              ringColor: Color(0xffe75517),
                            ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createuser() async {
    Map data = {
      "firstName": widget.Name.toString(),
      "lastName": widget.LastName.toString(),
      "password": widget.Password.toString(),
      "email": widget.Email.toString(),
      "phone": "+92" + widget.Phone.toString(),
      "type": "Customer"
    };
    await UserService().postApi("/user/signUp", data).then((value) {
      print(value);
      if (value["success"] == true) {
        var user = value["response"];
        UserService().setUser(user).then((value) {
          print("user is set");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Mall(
                        index: 0,
                      )),
              (route) => false);
        });
      } else {
        showMessage(context, "Something Went Wrong Please try again!");
      }
    });
  }

  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+92" + widget.Phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("Number is verified");
              // linkWithEmail();
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  void linkWithEmail() async {
    AuthCredential authCredential = EmailAuthProvider.credential(
        email: widget.Email, password: widget.Password);
    await FirebaseAuth.instance.currentUser
        ?.linkWithCredential(authCredential)
        .then((value) async {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "Name": widget.Name,
        "Email": widget.Email,
        "Password": widget.Password,
        // "Confirm": widget.Confirm,
        // "Address": widget.Address,
        // "countryCode": widget.countryCode,
        "Phone": widget.Phone,
      }).then((value) {
        Navigator.popUntil(context, (route) => false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Mall(index: 0)));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("SignUp Successfull")));
      });
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$error")));
    });
  }

  @override
  void initState() {
    super.initState();

    _verifyPhone();
  }
}
