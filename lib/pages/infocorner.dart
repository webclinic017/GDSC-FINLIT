// todo

import 'package:FinLit/extra/newstemplate.dart';
import 'package:FinLit/models/newsmodel.dart';
import 'package:FinLit/services/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InfoCorner extends StatefulWidget {
  final int activeState;
  InfoCorner({this.activeState = 0});
  @override
  _InfoCornerState createState() => _InfoCornerState(activeState: activeState);
}

class _InfoCornerState extends State<InfoCorner> {
  List<NewsModel> news = new List<NewsModel>();
  int activeState;
  String category;
  bool _loading = true;

  _InfoCornerState({this.activeState, this.category = "Relevant"});

  void initState() {
    super.initState();
    getAllNews();
  }

  getAllNews() async {
    News temp = News();

    if (category == "Relevant")
      news = await temp.getNews(country: "ph", type: "Relevant");
    else if (category == "Local")
      news = await temp.getNews(country: "ph", type: "Local");
    else
      news = await temp.getNews(type: "World");
    

  
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 0,
                    highlightElevation: 0,
                    // focusElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        activeState = 0;
                        category = "Relevant";
                        _loading = true;
                        getAllNews();
                      });
                    },
                    child: Text(
                      "Relevant",
                      style: TextStyle(
                        fontFamily: "Inter-Regular",
                        color: activeState == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                    color: activeState == 0
                        ? Color(0xFF536DFE)
                        : Color(0XFFD3D3D3),
                    splashColor: Colors.white12,
                    highlightColor: Colors.white12,
                  ),
                  MaterialButton(
                    elevation: 0,
                    highlightElevation: 0,
                    // focusElevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      setState(() {
                        activeState = 1;
                        category = "Local";
                        _loading = true;
                        getAllNews();
                      });
                    },
                    child: Text(
                      "Local",
                      style: TextStyle(
                        fontFamily: "Inter-Regular",
                        color: activeState == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                    color: activeState == 1
                        ? Color(0xFF536DFE)
                        : Color(0XFFD3D3D3),
                    splashColor: Colors.white12,
                    highlightColor: Colors.white12,
                  ),
                  MaterialButton(
                    elevation: 0,
                    highlightElevation: 0,
                    // focusElevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      setState(() {
                        activeState = 2;
                        category = "World";
                        _loading = true;
                        getAllNews();
                      });
                    },
                    child: Text(
                      "World",
                      style: TextStyle(
                        fontFamily: "Inter-Regular",
                        color: activeState == 2 ? Colors.white : Colors.black,
                      ),
                    ),
                    color: activeState == 2
                        ? Color(0xFF536DFE)
                        : Color(0XFFD3D3D3),
                    splashColor: Colors.white12,
                    highlightColor: Colors.white12,
                  ),
                ],
              )),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //           margin: EdgeInsets.fromLTRB(28, 5, 28, 5),
          //           padding: EdgeInsets.all(1),
          //           color: Colors.black45),
          //     ),
          //   ],
          // ),

          // ARI NA NI IBUTANG ANG GIKAN SA NEWS API
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Column(children: [
                  _loading
                      ? Container(
                        margin: EdgeInsets.fromLTRB(50, 250, 50, 150),
                        child: SpinKitCircle(size: 50, color: Color(0xFFD3D3D3))
                        )
                      : Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: news.length,
                              itemBuilder: (context, index) {
                                return NewsContainer(
                                    index: index,
                                    imageUrl: news[index].urlToImage,
                                    title: news[index].title,
                                    description: news[index].description,
                                    date: news[index].publishedAt,
                                    author: news[index].author,
                                    newsUrl: news[index].url,
                                );
                              }),
                        )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
