import 'package:flutter/material.dart';
import 'package:real_state/page/botoomNavigation/homePage/listDetails.dart';

class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
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
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "Listings",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),
        actions: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 50, right: 10),
                child: Image.asset("assests/phone-square.png"))
          ])
        ],
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: List.generate(
                    list.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListDetails(
                                          itemDetails: list[index],
                                        )));
                          },
                          child: Card(
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
                                          padding:
                                              const EdgeInsets.only(top: 15),
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
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
