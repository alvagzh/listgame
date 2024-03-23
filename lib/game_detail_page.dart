import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:listgame/game_store.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game;

  GameDetailPage({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              game.imageUrls[0],
              fit: BoxFit.cover,
              height: 200.0,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    game.about,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Genre: ${game.tags.join(', ')}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Release Date: ${game.releaseDate}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Reviews: ${game.reviewAverage} (${game.reviewCount} reviews)",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(game.linkStore);
                    },
                    child: Text('Visit Store'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
