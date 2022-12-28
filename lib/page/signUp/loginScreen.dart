import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/page/signUp/signUpScreen.dart';
import 'package:real_state/service/service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            // focusColor: Colors.black,

            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            hintText: 'Email',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: first,
        validator: (first) {
          if (first!.isEmpty) {
            return "Enter Email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(first)) {
            return "Enter a valid Email";
          }
          return null;
        },
      ),
    );
  }

  Widget _lasttName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            hintText: 'Password',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: last,
        validator: (last) {
          if (last!.isEmpty) {
            return "Enter Password";
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
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        leading: Container(

            // child: Text("Back",
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, color: Color(0xffe75517))),
            ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),

        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: logInformKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E-Mail",
                  style: TextStyle(fontSize: 16),
                ),
                _firstName(),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
                _lasttName(),
                loader
                    ? SpinKitFadingCircle(
                        // duration: Duration(milliseconds: 10000),
                        color: Colors.deepOrange,
                        size: 50.0,
                      )
                    : RawMaterialButton(
                        onPressed: () {
                          if (logInformKey.currentState!.validate()) {
                            login();
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Mall(
                          //               index: 0,
                          //             )));
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            height: height * 0.1 - 30,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 15),
                  child: Row(
                    children: [
                      Text("You are not Registered? "),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    setState(() {
      loader = true;
    });
    Map data = {
      "email": first.text.toString(),
      "password": last.text.toString(),
      "type": "Customer"
    };
    await UserService().postApi("/user/logIn", data).then((value) {
      print(value);
      if (value["success"] == true) {
        var user = value["Response"];
        UserService().setUser(user);
        // showMessage(context, "You are Login Succsessfully!");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Mall(
                      index: 0,
                    )),
            (route) => false);
      } else {
        first.clear();
        last.clear();
        showMessage(context, "Please Enter Valid Email or Password");
      }
    });
    setState(() {
      loader = false;
    });
  }

  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
