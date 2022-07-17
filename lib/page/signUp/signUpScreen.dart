import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/otp/otp.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController confrimPass = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool value = false;

  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _passwordVisible = false;
    });
  }

  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        // obscureText: !_passwordVisible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            // focusColor: Colors.black,

            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            hintText: 'First Name..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Color.fromARGB(255, 244, 238, 238),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: first,
        validator: (first) {
          if (first!.isEmpty) {
            return "Enter First Name";
          }
          return null;
        },
      ),
    );
  }

  Widget _lasttName() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
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
            hintText: 'Last Name..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Color.fromARGB(255, 244, 238, 238),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: last,
        validator: (last) {
          if (last!.isEmpty) {
            return "Enter Last Name";
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
            hintText: 'Email..',
            // fillColor: Color(0xfff2f2f2),
            fillColor: Color.fromARGB(255, 244, 238, 238),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        controller: email,
        validator: (email) {
          if (email!.isEmpty) {
            return "Enter Email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(email)) {
            return "Enter a valid Email";
          }
          return null;
        },
      ),
    );
  }

  Widget _City() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      child: TextFormField(
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
              hintText: 'City..',
              // fillColor: Color(0xfff2f2f2),
              fillColor: Color.fromARGB(255, 244, 238, 238),
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor:
      //     Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
      //         ? Colors.black
      //         : Color.fromARGB(255, 239, 236, 236),
      body: SingleChildScrollView(
          child: Form(
        key: logInformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.2 - 20,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // red as border color
                  ),
                  image: DecorationImage(
                      image: AssetImage("assests/Sign Up.png"))),
              child: Stack(
                children: [
                  Positioned(
                      left: 15,
                      top: 60,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(fontSize: 16),
                  ),
                  // _Password(),
                  _firstName(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Last Name",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _lasttName(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "E-Mail",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _Email(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _Password(),
                  pass.text.length == 0 || pass.text == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: height * 0.01,
                                width: width * 0.2,
                                color: pass.text.length > 3
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              Container(
                                height: height * 0.01,
                                width: width * 0.2,
                                color: pass.text.length > 5
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              Container(
                                height: height * 0.01,
                                width: width * 0.2,
                                color: pass.text.length > 7
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              Container(
                                height: height * 0.01,
                                width: width * 0.2,
                                color: pass.text.length > 9
                                    ? Colors.green
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Confrim Password",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _ConfrimPAss(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          focusColor: Colors.orange,
                          hoverColor: Colors.orange,
                          // overlayColor: Colors.orange,
                          activeColor: Colors.orange,
                          checkColor: Colors.green,
                          // fillColor: Colors.black,
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                              print(value);
                            });
                          },
                        ),
                        Text("I agree"),
                        Text(
                          "Term",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        Text(" & "),
                        Text(
                          "Policy",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (logInformKey.currentState!.validate() &&
                          value == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpCode(
                                      Name: first.text + " " + last.text,
                                      Email: email.text,
                                      Password: pass.text,
                                    )));
                      } else {
                        showMessage(context, "Please fill all attribute");
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: height * 0.1 - 30,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  static showMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
