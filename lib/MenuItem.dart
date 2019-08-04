class MenuItem {
  String _menuText;
  String _menuImg;

  MenuItem(this._menuText, this._menuImg);

  String get menuText => _menuText;

  set menuText(String value) {
    _menuText = value;
  }

  String get menuImg => _menuImg;

  set menuImg(String value) {
    _menuImg = value;
  }
}
