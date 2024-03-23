import 'package:flutter/material.dart';
import 'package:listgame/loginpage.dart';
import 'package:listgame/game_list_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/gameList': (context) => GameListPage(),
    },
  ));
}
