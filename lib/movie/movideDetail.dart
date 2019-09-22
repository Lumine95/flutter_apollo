import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  String title;

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState();
  }

  MovieDetail({Key, key, @required this.title}) : super(key: key);
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
    );
  }
}
