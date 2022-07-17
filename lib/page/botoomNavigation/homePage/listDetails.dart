import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';

class ListDetails extends StatefulWidget {
  var itemDetails;
  ListDetails({Key? key, this.itemDetails}) : super(key: key);

  @override
  State<ListDetails> createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  List list = ["Thousand", "Lac", "Core"];
  String? _selectedValue;
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 10,
                child: Text(
                  "click profile to view more listing",
                  style: TextStyle(
                    color: Color(0xffe75517),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Mall(index: 3)),
                      (route) => false);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xffe75517),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            ExactAssetImage("assests/Ellipse 1.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Text(
                        "M.ATEEB",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // alignment: Alignment.topLeft,
                    height: height * 0.3 + 20,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.itemDetails["image"]))),
                  ),
                  Positioned(
                    top: 60,
                    left: 15,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 15),
                          height: height * 0.1 - 45,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60)),
                          child: Icon(Icons.share),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: height * 0.1 - 45,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60)),
                          child: Icon(Icons.favorite_outline),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.1 - 35,
                            width: width * 0.2 + 30,
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xffe75517))),
                            child: Text(
                              "10.5 lac",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              alter();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 0.1 - 35,
                              width: width * 0.2 + 30,
                              decoration: BoxDecoration(
                                  color: Color(0xffe75517),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: Text(
                                "Bid Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Last Bid",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "This bid is colosed in:",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "3Days 56Hours 2min 33s",
                          style: TextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          "Listing Title",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                  "It is a long establiContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."),
                            ],
                          ),
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

  alter() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              titlePadding: EdgeInsets.only(top: 20, bottom: 20),
              title: Column(
                children: [
                  Center(
                    child: Text(
                      "Enter Your Bid",
                      style: TextStyle(
                          // color: Color(0xff3e5d9d),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height:
                                MediaQuery.of(context).size.height * 0.1 - 30,
                            width: MediaQuery.of(context).size.width * 0.3 + 20,
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                // obscureText: !_passwordVisible,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    // focusColor: Colors.black,

                                    // contentPadding: const EdgeInsets.symmetric(
                                    //     horizontal: 25, vertical: 20),
                                    hintText: 'Bid..',
                                    // fillColor: Color(0xfff2f2f2),
                                    fillColor:
                                        Color.fromARGB(255, 244, 238, 238),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: first,
                                validator: MinLengthValidator(3,
                                    errorText:
                                        "Password must be more then 3 words")),
                          ),
                          Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.1 - 30,
                              width:
                                  MediaQuery.of(context).size.width * 0.2 + 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 244, 238, 238),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton(
                                // onTap: () {
                                //   Navigator.pop(context);
                                //   alter();
                                // },
                                // borderRadius: BorderRadius.,
                                hint: _selectedValue == null
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text('Lac'),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          _selectedValue!,
                                          // style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(color: Colors.black),
                                items: ['Thu', 'Lac', 'Core'].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _selectedValue = val.toString();
                                      Navigator.pop(context);
                                      alter();
                                    },
                                  );
                                },
                              )),
                        ]),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.only(bottom: 40, right: 20, left: 20),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1 - 40,
                      width: MediaQuery.of(context).size.width * 0.3 - 10,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1 - 40,
                    width: MediaQuery.of(context).size.width * 0.3 - 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ));
  }
}
