import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF1177B0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text("知乎日报"),
            centerTitle: true,
          ),
          body: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "测试知乎日报啦啦啦啦啦啦",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    "https://wx4.sinaimg.cn/mw690/8725b930gy1ggwc946obgj20dw0fs412.jpg",
                    width: 88,
                    height: 88,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class DoubanHomePage extends StatefulWidget {
  @override
  _DoubanHomePageState createState() => _DoubanHomePageState();
}

class _DoubanHomePageState extends State<DoubanHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Widget buildDefaultTabController(BuildContext context) {
//  return DefaultTabController(
//    length: 3,
//    child: Scaffold(
//      appBar: AppBar(
//        title: Text("Apollo"),
//        centerTitle: true,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {},
//          )
//        ],
//      ),
//      drawer: Drawer(
//        child: ListView(
//          padding: EdgeInsets.all(0),
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              currentAccountPicture: CircleAvatar(
//                backgroundImage: NetworkImage(
//                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959667488&di=9a2ed3e07cb5333385757f8dcf72f70a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F947e85a92e41bba79efe71cbbc293a5cb1b8c245c9bf-CDlkKO_fw658"),
//              ),
//              accountName: Text("Light"),
//              accountEmail: Text("ZhangMingming@qq.com"),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                      fit: BoxFit.cover,
//                      image: NetworkImage(
//                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959667488&di=9a2ed3e07cb5333385757f8dcf72f70a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F947e85a92e41bba79efe71cbbc293a5cb1b8c245c9bf-CDlkKO_fw658"))),
//            ),
//            ListTile(
//              title: Text("豆瓣电影"),
//              leading: Icon(Icons.movie_filter),
//            ),
//            ListTile(
//              title: Text("携程旅行"),
//              leading: Icon(Icons.airplanemode_active),
//              onTap: () {
//                print(context.toString());
////                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
////                    return MovieDetail(
////                      title: "title",
////                    );
////                  }));
//              },
//            )
//          ],
//        ),
//      ),
//      bottomNavigationBar: Container(
//          height: 40,
//          decoration: BoxDecoration(color: Colors.blueAccent),
//          child: TabBar(
//            indicator: null,
//            tabs: <Widget>[Tab(text: "正在热映"), Tab(text: "即将上映"), Tab(text: "TOP250")],
//          )),
//      body: TabBarView(
//        children: <Widget>[MovieList(type: "in_theaters"), MovieList(type: "coming_soon"), MovieList(type: "top250")],
//      ),
//    ),
//  );
//}
