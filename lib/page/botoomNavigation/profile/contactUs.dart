import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              // focusColor: Colors.black,

              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Name..',
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
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
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
              hintText: 'Subject..',
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
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
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

  Widget _City() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2 + 10,
        child: TextFormField(
            maxLines: 15,
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
                hintText: 'Message..',
                // fillColor: Color(0xfff2f2f2),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            controller: city,
            validator: MinLengthValidator(3,
                errorText: "Password must be more then 3 words")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),

        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 16),
              ),
              _firstName(),
              Text(
                "Email",
                style: TextStyle(fontSize: 16),
              ),
              _Email(),
              Text(
                "Subject",
                style: TextStyle(fontSize: 16),
              ),
              _lasttName(),
              Text(
                "Message",
                style: TextStyle(fontSize: 16),
              ),
              _City(),
              RawMaterialButton(
                onPressed: () {},
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40),
                    height: height * 0.1 - 35,
                    width: width * 0.3 + 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffe75517),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
