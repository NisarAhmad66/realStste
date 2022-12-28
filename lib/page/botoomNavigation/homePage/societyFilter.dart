import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SocietyFilter extends StatefulWidget {
  const SocietyFilter({Key? key}) : super(key: key);

  @override
  State<SocietyFilter> createState() => _SocietyFilterState();
}

class _SocietyFilterState extends State<SocietyFilter> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  Widget _firstName() {
    return Container(
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              // focusColor: Colors.black,

              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              hintText: 'Search..',
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

  List city = [
    {"name": "Society1"},
    {"name": "Society2"},
    {"name": "Society3"},
    {"name": "Society4"},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffac4ab),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    height: height * 0.1 - 20,
                    width: width * 0.7 + 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: _firstName()),
                Container(
                  alignment: Alignment.center,
                  height: height * 0.1 - 20,
                  width: width * 0.1 + 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.search,
                    size: 36,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade400))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  city.length,
                  (index) => Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                        margin: EdgeInsets.only(left: 20),
                        width: width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white54))),
                        child: Text(
                          city[index]["name"],
                          style: TextStyle(
                              color: Color(0xffe75517),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
