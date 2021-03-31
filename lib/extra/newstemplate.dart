import 'package:FinLit/extra/newsarticle.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String author;
  final String newsUrl;
  final DateFormat formatter = DateFormat('yMMMMd');
  final int index;

  NewsContainer(
      {this.imageUrl,
      this.title,
      this.description,
      this.date,
      this.author,
      this.newsUrl,
      this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: InkWell(
          onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewsArticle(initialUrl: newsUrl)));
        },
          splashColor: Colors.black12,
            highlightColor: Colors.black12,
        child: (index != 0)
            ? Ink(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                // margin: EdgeInsets.only(bottom: 15),
                // decoration: BoxDecoration(
                //     border: Border(
                //       bottom: BorderSide(width: 1, color: Colors.black54)
                //     ),
                // ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  // border: Border.all(width: 8, color: Colors.black54),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1.8), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Ink(
                        // margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    height: 1.4,
                                    fontFamily: "Inter-Medium",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                            SizedBox(height: 10),
                            Text("${formatter.format(DateTime.parse(date))}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Inter-Regular",
                                  fontSize: 10,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Ink(
                        child: ClipRRect(
                            child: Image.network(imageUrl,
                                width: 100, height: 100, fit: BoxFit.cover)),
                      ),
                    )
                  ],
                ))
            : Ink(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                // margin: EdgeInsets.only(bottom: 15),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //     border: Border(
                //         bottom: BorderSide(
                //   color: Colors.black,
                //   width: 3.0,
                // ))),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  // border: Border.all(width: 8, color: Colors.black54),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1.8), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Top Coverage",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: "Inter-Medium",
                              fontWeight: FontWeight.w800,
                              fontSize: 18)),
                      SizedBox(height: 10),
                      Ink(
                        // decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black)),
                        child: ClipRRect(
                            child: Image.network(imageUrl,
                                width: 500, height: 250, fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 10),
                      Text(title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              height: 1.4,
                              fontFamily: "Inter-Regular",
                              fontWeight: FontWeight.w800,
                              fontSize: 18)),
                      SizedBox(height: 10),
                      Text(
                          "By: $author | ${formatter.format(DateTime.parse(date))}",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Inter-Regular")),
                      SizedBox(height: 5),
                      Text(description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontFamily: "Inter-Regular"))
                    ]),
              ),
    ),
      )
      );
  }
}
