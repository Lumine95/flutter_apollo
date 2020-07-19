import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apollo/movie/movideDetail.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  String type;

  @override
  State<StatefulWidget> createState() {
    return new _MovieListState();
  }

  MovieList({Key key, @required this.type}) : super(key: key);
}

// StatefulWidget必须有状态管理类，用于渲染MovieList控件UI结构
class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin {
  int page = 1;
  int size = 10;
  var movieList = [];

  @override
  void initState() {
    super.initState();
    getMovieList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = movieList[index];

        List directors = item["directors"];
        List castList = item["casts"];
        List directorName = [];
        List castName = [];
        directors.forEach((value) => directorName.add(value["name"]));
        castList.forEach((value) => castName.add(value["name"]));

        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return new MovieDetail(item: item);
              }));
            },
            child: Row(
              children: <Widget>[
                Image.network(
                  item["images"]["large"],
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Expanded(
                    child: Container(
                        height: 200,
                        padding: EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              item["title"],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text("导演：${directorName.join('/')}"),
                            Text("主演：${castName.join('/')}"),
                            Text("类型：${item["genres"].join('/')}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("评分："),
                                Text("${item["rating"]["average"]}", style: TextStyle(color: Colors.red)),
                              ],
                            )
                          ],
                        ))),
              ],
            ));
      },
    );
  }

  getMovieList() async {
    var response =
        await dio.get("http://api.douban.com/v2/movie/${widget.type}?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=10");
    // 为私有数据赋值，需要把赋值的操作放到setState函数中，否则页面不会刷新
    print(response);
    setState(() {
      movieList = response.data["subjects"];
    });
  }

  @override
  bool get wantKeepAlive => true;
}
