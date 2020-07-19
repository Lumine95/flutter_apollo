import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  var item;

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState();
  }

  MovieDetail({Key, key, @required this.item}) : super(key: key);
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item["title"]),
        centerTitle: true,
      ),
      body: Text(widget.item.toString()),
    );
  }
}
