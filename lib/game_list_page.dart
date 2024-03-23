import 'package:flutter/material.dart';
import 'package:listgame/game_store.dart';
import 'package:listgame/game_detail_page.dart';

class GameListPage extends StatelessWidget {
  final List<GameStore> games = gameList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Store'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailPage(game: games[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    games[index].imageUrls[0],
                    fit: BoxFit.cover,
                    height: 120.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      games[index].name,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
