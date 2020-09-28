import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apollo/ui/zhihu/daily_news.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'menu_item.dart';
import 'ui/navigationBar/bottom_navigation_bar.dart';
import 'value/color.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var itemList = [];

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    itemList.add(
        MenuItem("知乎日报", "https://img2.woyaogexing.com/2020/06/02/e70e13227ed445fbb7f9b636503f864e!400x400.jpeg", DailyNews()));
    itemList.add(MenuItem("NavigationBar",
        "https://img2.woyaogexing.com/2020/07/24/e27c9910210343f681165c139fb58e5b!400x400.jpeg", BottomNavigationBarHome()));
    itemList.add(MenuItem("测试", "https://img2.woyaogexing.com/2020/06/10/00e0034144fe4f9ea540e12e27ed9074!400x400.jpeg", null));
    itemList.add(MenuItem("测试", "https://img2.woyaogexing.com/2020/05/11/7a58302576dd4c9bb1dd6f75aa086315!400x400.jpeg", null));
    itemList.add(MenuItem("测试", "https://img2.woyaogexing.com/2020/02/24/755a1b44698849d188413768fc3ff663!400x400.jpeg", null));
    itemList.add(MenuItem("测试", "https://img2.woyaogexing.com/2020/07/13/71c25250da8540839fadbb003ce8863f!400x400.jpeg", null));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtil.themeColor,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.f6f6f6,
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body: buildGridView(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: ColorUtil.themeColor,
        onPressed: () => {
          Fluttertoast.showToast(msg: "test"),
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          MenuItem item = itemList[index];
          return GestureDetector(
            onTap: () {
              if (item.widget != null) {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                  return item.widget;
                }));
              }
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
//                  side: BorderSide(color: Colors.green, width: 25),
              ),
              clipBehavior: Clip.antiAlias,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        child: Image.network(item.menuImg, width: 66, height: 66, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      item.menuText,
                      style: TextStyle(fontWeight: FontWeight.bold, color: ColorUtil.color3),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
