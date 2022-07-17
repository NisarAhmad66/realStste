import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouritPage extends StatefulWidget {
  const FavouritPage({Key? key}) : super(key: key);

  @override
  State<FavouritPage> createState() => _FavouritPageState();
}

class _FavouritPageState extends State<FavouritPage> {
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
              Icons.arrow_back_ios_new_sharp,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Favourites",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),

        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assests/buildings.png"))),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: List.generate(
                    list.length,
                    (index) => Card(
                          elevation: 10,
                          color: Color(0xfffac4aa),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                              height: height * 0.2 - 25,
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
                                        margin: EdgeInsets.only(left: 15),
                                        height: height * 0.1 + 30,
                                        width: width * 0.3 + 15,
                                        decoration: BoxDecoration(
                                            // color: Colors.black,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    list[index]["image"])),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list[index]["title"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0, top: 10),
                                              child: Container(
                                                height: 90,
                                                width: 180,
                                                child: Text(
                                                  list[index]["sub"],
                                                  // strutStyle: ,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
