import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apollo/value/color.dart';

class DailyNews extends StatefulWidget {
  @override
  _DailyNewsState createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    getMovieList();
  }

  var newsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("知乎日报"), centerTitle: true),
      body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = newsList[index];
            return buildItem(item);
          }),
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

  getMovieList() async {
    Dio dio = new Dio();
    var response = await dio.get("https://news-at.zhihu.com/api/4/news/latest");
    print(response);
    setState(() {
      newsList.addAll(response.data["stories"]);
      newsList.addAll(response.data["stories"]);
//      newsList = response.data["stories"];
    });
  }

  Widget buildItem(item) {
    return Container(
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
    );
  }
}
