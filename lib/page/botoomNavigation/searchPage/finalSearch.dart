import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FinalSearch extends StatefulWidget {
  const FinalSearch({Key? key}) : super(key: key);

  @override
  State<FinalSearch> createState() => _FinalSearchState();
}

class _FinalSearchState extends State<FinalSearch> {
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextFormField(
          // readOnly: true,
          keyboardType: TextInputType.emailAddress,
          // obscureText: !_passwordVisible,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              // focusColor: Colors.black,

              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              hintText: 'Name..',
              suffixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xffe75517),
              ),
              // fillColor: Color(0xfff2f2f2),
              fillColor: Color.fromARGB(255, 244, 238, 238),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          controller: first,
          // onTap: () {
          //   print("i am here");
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => FinalSearch()));
          // },
          // onChanged: (){},

          validator: MinLengthValidator(3,
              errorText: "Password must be more then 3 words")),
    );
  }

  List list = [
    {
      "image": "assests/a.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/b.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/c.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/d.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/a.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
    {
      "image": "assests/b.jpeg",
      "title": "Listing Tile",
      "sub":
          "In general, paragraphs consist of three parts: the topic sentence, body sentences, and the concluding or the bridge sentence to the next paragraph or section. Paragraphs show where the subdivisions of a research paper begin and end and, thus, help the reader see the organization of the essay and grasp its main points."
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
          title: Column(
            children: [
              Text(
                "Search",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffe75517)),
              ),
            ],
          ),

          // iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstName(),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
                child: Text("Recent Listing"),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    child: Column(
                      children: List.generate(
                          list.length,
                          (index) => Card(
                                elevation: 10,
                                color: Color(0xfffac4aa),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Container(
                                    height: height * 0.2 - 40,
                                    width: width,
                                    decoration: BoxDecoration(
                                        // color: Color(0xfffac4aa),
                                        // borderRadius: BorderRadius.circular(50)
                                        ),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              height: height * 0.1 + 30,
                                              width: width * 0.3 + 15,
                                              decoration: BoxDecoration(
                                                  // color: Colors.black,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          list[index]
                                                              ["image"])),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, right: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list[index]["title"],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            right: 0,
                                                            top: 5),
                                                    child: Container(
                                                      height: 80,
                                                      width: 170,
                                                      child: Text(
                                                        list[index]["sub"],
                                                        // strutStyle: ,
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          right: 25,
                                          top: 10,
                                          child: Icon(
                                            Icons.favorite_outline_sharp,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    )),
                              )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
