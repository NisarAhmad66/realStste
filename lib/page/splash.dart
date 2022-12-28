import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/page/signUp/loginScreen.dart';
import 'package:real_state/page/signUp/signUpScreen.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:real_state/service/service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      //   Timer(
      //       Duration(seconds: 2),
      //       () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (BuildContext context) => LoginScreen())));

      Timer(Duration(seconds: 2), () => getUser());
    });
  }

  getUser() async {
    await UserService().getUser().then((value) {
      print("this is shred pref");
      print(value);
      if (value != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Mall(
                      index: 0,
                    )),
            (route) => false);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //     // color: Colors.white,
        //     image: DecorationImage(
        //         image: AssetImage(
        //   "assests/pb logo 3.png",
        // ))
        // )
        child: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Icon(
                Icons.mp_sharp,
                color: Colors.white,
              )
            : Image.asset("assests/pb logo 3.png", height: 250, width: 250),
      ),
    );
  }
}
