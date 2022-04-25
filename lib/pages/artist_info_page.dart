import 'package:flutter/material.dart';
import 'package:modul7_homework/dictionary/artist.dart';

class ArtistInfoPage extends StatelessWidget {
  ArtistInfoPage({Key? key, required this.artist}) : super(key: key);
  Artist artist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(artist.info),
          ),
        ],
      ),
    );
  }
}
