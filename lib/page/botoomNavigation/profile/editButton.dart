import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/page/botoomNavigation/profile/passwordReset.dart';
import 'package:real_state/service/service.dart';

class EditButton extends StatefulWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController(text: "Ahmad");
  TextEditingController email =
      TextEditingController(text: "nisarahmad6690@gmail.com");
  TextEditingController city = TextEditingController(text: "Lahore");
  TextEditingController restPass =
      TextEditingController(text: "Reset Password");
  TextEditingController privcyPolicy =
      TextEditingController(text: "Privacy Policy");
  TextEditingController confrimPass = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool value = false;
  var firstNmae;
  var lastNmae;
  bool loader = false;

  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _passwordVisible = false;
      first.text = "Nisar";
      getUser();
    });
  }

  var user;

  getUser() async {
    await UserService().getUser().then((value) {
      print(value);
      user = value;
      first.text = value["FirstName"];
      last.text = value["LastName"];
      email.text = value["Email"];
    });
  }

  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          decoration: InputDecoration(
              // focusColor: Colors.black,
              suffixIcon: Image.asset("assests/edit-2.png"),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'First Name..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: first,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _lasttName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          // keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: Image.asset("assests/edit-2.png"),
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
              hintText: 'Last Name..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: last,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _Email() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          // obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: Image.asset("assests/edit-2.png"),
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
              hintText: 'Email..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: email,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _ResetPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          readOnly: true,
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          // obscureText: !_passwordVisible,
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasswordReset()));
            });
          },
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Reset Password..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: restPass,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _PrivcyPolicy() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          // obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
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
              hintText: 'Privcy Policy..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: privcyPolicy,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _City() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Color(0xffe75517)),
          // obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: Image.asset("assests/edit-2.png"),
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
              hintText: 'City..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: city,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  Widget _Password() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              // enabledBorder: InputBorder.none,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: _passwordVisible ? Colors.blue : Colors.black,
                ),
              ),
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Password..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Color.fromARGB(255, 244, 238, 238),
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
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              // enabledBorder: InputBorder.none,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: _passwordVisible ? Colors.blue : Colors.black,
                ),
              ),
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Confrim Password..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Color.fromARGB(255, 244, 238, 238),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: confrimPass,
          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

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
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 30,
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.grey,
                            )),
                        Text(
                          "ACCOUNTS",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffe75517)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: CircleAvatar(
                            backgroundImage:
                                ExactAssetImage("assests/Ellipse 1.png"),
                            radius: 40,
                            child: Stack(children: [
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.add_circle_sharp,
                                    color: Color(0xffe75517),
                                  )),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    _firstName(),
                    _lasttName(),
                    _Email(),
                    // _City(),
                    _ResetPassword(),
                    _PrivcyPolicy(),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          resetUser();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        height: height * 0.1 - 35,
                        width: width * 0.3 + 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffe75517),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  resetUser() async {
    setState(() {
      loader = true;
    });
    Map data = {
      "firstName": first.text,
      "lastName": last.text,
      "email": email.text,
      "password": user["Password"],
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
          user["FirstName"] = first.text;
          user["LastName"] = last.text;
          user["Email"] = email.text;
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
