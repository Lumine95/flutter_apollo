import 'package:flutter/material.dart';

import 'movie/movideDetail.dart';
import 'movie/movieList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Apollo"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959667488&di=9a2ed3e07cb5333385757f8dcf72f70a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F947e85a92e41bba79efe71cbbc293a5cb1b8c245c9bf-CDlkKO_fw658"),
                ),
                accountName: Text("Light"),
                accountEmail: Text("ZhangMingming@qq.com"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959667488&di=9a2ed3e07cb5333385757f8dcf72f70a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F947e85a92e41bba79efe71cbbc293a5cb1b8c245c9bf-CDlkKO_fw658"))),
              ),
              ListTile(
                title: Text("豆瓣电影"),
                leading: Icon(Icons.movie_filter),
              ),
              ListTile(
                title: Text("携程旅行"),
                leading: Icon(Icons.airplanemode_active),
                onTap: () {
                  print(context.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return MovieDetail(
                      title: "title",
                    );
                  }));
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 40,
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: TabBar(
              indicator: null,
              tabs: <Widget>[Tab(text: "正在热映"), Tab(text: "即将上映"), Tab(text: "TOP250")],
            )),
        body: TabBarView(
          children: <Widget>[MovieList(type: "in_theaters"), MovieList(type: "coming_soon"), MovieList(type: "top250")],
        ),
      ),
    ));
  }
}
