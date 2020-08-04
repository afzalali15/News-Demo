import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_demo/models/news.dart';
import 'package:news_demo/services/api_manager.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsData;

  @override
  void initState() {
    super.initState();

    _newsData = API_Manager().getBreakingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Demo'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsData,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    var newsItem = snapshot.data.data[i];
                    var formattedTime = DateFormat('dd MMM, yy HH:mm')
                        .format(newsItem.khabarDate);
                    return Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  newsItem.pic.isEmpty
                                      ? Strings.imagePlaceholder
                                      : newsItem.pic,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(formattedTime),
                                Text(
                                  newsItem.khabarTitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  newsItem.khabarDetails,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            else {
              return Container(
                alignment: Alignment.center,
                child: Text('Loading....'),
              );
            }
          },
        ),
      ),
    );
  }
}
