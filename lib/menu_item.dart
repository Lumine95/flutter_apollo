import 'package:flutter/cupertino.dart';

class MenuItem {
  String _menuText;
  String _menuImg;
  Widget _widget;

  MenuItem(this._menuText, this._menuImg, this._widget);

  Widget get widget => _widget;

  set widget(Widget value) {
    _widget = value;
  }

  String get menuText => _menuText;

  set menuText(String value) {
    _menuText = value;
  }

  String get menuImg => _menuImg;

  set menuImg(String value) {
    _menuImg = value;
  }
}
