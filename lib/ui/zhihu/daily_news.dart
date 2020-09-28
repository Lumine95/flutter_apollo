import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apollo/ui/space.dart';
import 'package:flutter_apollo/value/color.dart';
import 'package:flutter_apollo/view/space_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DailyNews extends StatefulWidget {
  @override
  _DailyNewsState createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  var currentDate = DateUtil.formatDate(DateTime.now(), format: "yyyyMMdd");

  var newsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("知乎日报" + currentDate), centerTitle: true),
      body: EasyRefresh.custom(
        topBouncing: true,
        header: SpaceHeader(),
        footer: ClassicalFooter(enableHapticFeedback: false),
        onRefresh: () async {
          getNewsList();
        },
        onLoad: () async {
          getNewsBefore();
        },
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return buildItem(context, newsList[index]);
            }, childCount: newsList.length),
          )
        ],
//        child: ListView.builder(
//            itemCount: newsList.length,
//            itemBuilder: (BuildContext context, int index) {
//              return buildItem(context, newsList[index]);
//            }),in
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: ColorUtil.themeColor,
        onPressed: () => {selectDate(context)},
        child: Icon(Icons.today),
      ),
    );
  }

  selectDate(BuildContext context) {
    print(DateTime.now());
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(new Duration(days: 30)),
            lastDate: DateTime.now().add(new Duration(days: 30)))
        .then((value) => print(value))
        .catchError((error) => {print(error)});
  }

  getNewsList() async {
    Dio dio = new Dio();
//    https://news-at.zhihu.com/api/4/stories/before/
    var response = await dio.get("https://news-at.zhihu.com/api/4/news/latest");
    print(response);
    setState(() {
      newsList.clear();
      newsList.addAll(response.data["stories"]);
    });
  }

  getNewsBefore() async {
    Dio dio = new Dio();
//    https://news-at.zhihu.com/api/4/stories/before/
    var response = await dio.get("https://news-at.zhihu.com/api/4/stories/before/20200101");
    print(response);
    setState(() {
      newsList.addAll(response.data["stories"]);
    });
  }

  Widget buildItem(context, item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
          return SpacePage();
        }))
      },
      child: Container(
        height: 105,
//      foregroundDecoration: BoxDecoration(color: Color.fromARGB(55, 5, 2, 0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(item["title"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: <Widget>[
                        Text(item["hint"], style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  item["images"][0],
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
