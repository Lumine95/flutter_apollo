import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apollo/value/color.dart';

class NewsDetail extends StatefulWidget {
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  var data;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    getNewsDetail();

//    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.f6f6f6,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Test"),
              background: Image.network("http://p15.qhimg.com/t01d13ca19600335461.jpg", fit: BoxFit.cover),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
//            SliverPersistentHeaderDelegate
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getNewsDetail() async {
    Dio dio = new Dio();
    var response = await dio.get("https://news-at.zhihu.com/api/4/news/9726548");
    setState(() {
      data = response.data;
    });
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
