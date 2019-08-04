import 'package:flutter/material.dart';
import 'MenuItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Apollo"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GridViewState();
}

class GridViewState extends State {
  @override
  Widget build(BuildContext context) {
    var menuList = new List<MenuItem>();
   // menuList..add(new MenuItem("",""))..add("");
    return new GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 4 / 5),
        itemBuilder: (BuildContext context, int index) {
          return item(
            context,
          );
        });
  }

  Widget item(BuildContext context) {}
}
