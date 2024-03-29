import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:real_state/page/botoomNavigation/bottomNavigationbar.dart';
import 'package:real_state/page/botoomNavigation/searchPage/finalSearch.dart';
import 'package:real_state/service/service.dart';

class SearchPage extends StatefulWidget {
  bool status;
  SearchPage({Key? key, required this.status}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool favourit = true;
  GlobalKey<FormState> logInformKey = GlobalKey<FormState>();
  TextEditingController first = TextEditingController();
  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextFormField(
          readOnly: widget.status == true ? false : true,
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
          onTap: () {
            if (widget.status == true) {
              print("i am here");
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Mall(index: 0)),
                  (route) => false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            status: true,
                          )));
            }
          },
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
  bool loader = false;
  List post = [];
  var userid;
  var postid;
  @override
  void initState() {
    setState(() {
      print(widget.status);
      getuser();
      // getPost();
    });
    super.initState();
  }

  getuser() async {
    await UserService().getUser().then((value) {
      print(value);
      userid = value["_id"];
    });
  }

  getPost() async {
    setState(() {
      loader = true;
    });
    await UserService().getApi("/admin/all/approvedPosts").then((value) {
      print(value);
      post = value["Posts"];
      setState(() {
        loader = false;

        // if (post[0]["favourites"] == userid) {
        //   print("i nisar");
        // } else {
        //   print("not nisar");
        // }
        // ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return loader
        ? SpinKitFadingCircle(
            // duration: Duration(milliseconds: 10000),
            color: Colors.deepOrange,
            size: 50.0,
          )
        : post == null || post.length == 0
            ? Center(
                child: Text("There is post Avabile"),
              )
            : Scaffold(
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
                        padding: const EdgeInsets.only(
                            left: 20, top: 15, bottom: 20),
                        child: Text("Recent Listing"),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            child: Column(
                              children: List.generate(
                                  post.length,
                                  (index) => Card(
                                        elevation: 10,
                                        color: Color(0xfffac4aa),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      height: height * 0.1 + 30,
                                                      width: width * 0.3 + 15,
                                                      decoration: BoxDecoration(
                                                          // color: Colors.black,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  list[index][
                                                                      "image"])),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              right: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            post[index]
                                                                ["Title"],
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5,
                                                                    right: 0,
                                                                    top: 5),
                                                            child: Container(
                                                              height: 80,
                                                              width: 170,
                                                              child: Text(
                                                                post[index][
                                                                    "Description"],
                                                                // strutStyle: ,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                                maxLines: 4,
                                                                overflow:
                                                                    TextOverflow
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
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        favourit = !favourit;
                                                        postid =
                                                            post[index]["_id"];
                                                        // favoueit();
                                                      });
                                                    },
                                                    child: favourit
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_outline_sharp,
                                                            color:
                                                                Colors.black),
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

  favoueit() async {
    Map data = {
      "userId": userid.toString(),
      "postId": postid.toString(),
    };
    await UserService().postApi("/posts/favourite", data).then((value) {
      print(value);
    });
  }
}
