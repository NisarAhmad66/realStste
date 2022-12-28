import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/service/service.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController city = TextEditingController();
  TextEditingController confrimPass = TextEditingController();
  TextEditingController pass = TextEditingController();
  Widget _City() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
      child: TextFormField(
          obscureText: true,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          decoration: InputDecoration(
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Current Password..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: city,
          validator: (city) {
            if (city!.isEmpty) {
              return "Enter Current Password";
            }
            if (city != user["Password"]) {
              return "Invaild Current Password";
            }
          }),
    );
  }

  Widget _Password() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              // enabledBorder: InputBorder.none,
              // suffixIcon: InkWell(
              //   onTap: () {
              //     setState(() {
              //       _passwordVisible = !_passwordVisible;
              //     });
              //   },
              //   child: Icon(
              //     Icons.remove_red_eye_outlined,
              //     color: _passwordVisible ? Colors.blue : Colors.black,
              //   ),
              // ),
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Password..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: pass,
          onChanged: (String v) {
            if (pass.text.length == 0 || pass.text == null) {
              setState(() {
                pass.text = v;
              });
            } else if (pass.text.length > 3) {
              setState(() {
                v = pass.text;
              });
            } else if (pass.text.length > 5) {
              setState(() {
                v = pass.text;
              });
            } else if (pass.text.length > 7) {
              setState(() {
                v = pass.text;
              });
            } else if (pass.text.length > 9) {
              setState(() {
                v = pass.text;
              });
            }
          },
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _ConfrimPAss() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            // enabledBorder: InputBorder.none,
            // suffixIcon: InkWell(
            //   onTap: () {
            //     setState(() {
            //       conffrimPass = !conffrimPass;
            //     });
            //   },
            //   child: Icon(
            //     Icons.remove_red_eye_outlined,
            //     color: conffrimPass ? Colors.blue : Colors.black,
            //   ),
            // ),
            hoverColor: Colors.white,
            focusColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            hintText: 'Confrim Password..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: confrimPass,
        validator: (confpassword) {
          if (confpassword!.isEmpty) {
            return "Enter Password";
          } else if (pass.text != confpassword) {
            return "Password is  not match";
          } else {
            return null;
          }
        },
      ),
    );
  }

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
      user = value;
    });
  }

  bool loader = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      body: loader
          ? SpinKitFadingCircle(
              // duration: Duration(milliseconds: 10000),
              color: Colors.deepOrange,
              size: 50.0,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                  child: Form(
                key: logInformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe75517)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Current password",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    _City(),
                    Text(
                      "New password",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    _Password(),
                    Text(
                      "Confrim password",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    _ConfrimPAss(),
                    RawMaterialButton(
                      onPressed: () {
                        if (logInformKey.currentState!.validate()) {
                          resetUser();
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          height: height * 0.1 - 30,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              )),
            ),
    );
  }

  resetUser() async {
    setState(() {
      loader = true;
    });
    Map data = {
      "firstName": user["FirstName"].toString(),
      "lastName": user["LastName"].toString(),
      "email": user["Email"].toString(),
      "password": confrimPass.text,
      "type": "Customer",
      "phone": user["Phone"],
    };
    await UserService()
        .postApi("/user/update/" + user["_id"], data)
        .then((value) {
      print(value);
      if (value["success"] == true) {
        setState(() {
          loader = false;
          user["Password"] = confrimPass.text;
          UserService().setUser(user);
          print(user["Password"]);
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Mall(index: 4)),
            (route) => false);
      } else {
        setState(() {
          loader = false;
          city.clear();
          pass.clear();
          confrimPass.clear();
          showMessage(context, value["message"]);
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
