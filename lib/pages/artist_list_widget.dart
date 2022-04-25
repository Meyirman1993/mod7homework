// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:modul7_homework/dictionary/artist.dart';
import 'package:modul7_homework/pages/artist_info_page.dart';

class ArtistsListWidget extends StatefulWidget {
  ArtistsListWidget({Key? key, required this.list}) : super(key: key);
  Future<List<Artist>> list;
  @override
  State<ArtistsListWidget> createState() => _ArtistsListWidgetState();
}

class _ArtistsListWidgetState extends State<ArtistsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      body: FutureBuilder(
        future: widget.list,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              final listOfArtist = snapshot.data! as List<Artist>;
              return ListView.builder(
                itemCount: listOfArtist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(listOfArtist[index].name),
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistInfoPage(
                            artist: listOfArtist[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            default:
              return const Text('');
          }
        },
      ),
    );
  }
}




// FutureBuilder(
//         future: widget.list,
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return const CircularProgressIndicator();
//             case ConnectionState.done:
//               final listOfArtist = snapshot.data as List<Artist>;
//               return ListView.builder(
//                 itemCount: listOfArtist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(listOfArtist[index].name),
//                     onTap: () {
//                       GoRouter.of(context).pushNamed(
//                         'infoPage',
//                         params: {'ait': listOfArtist[index].id},
//                       );
//                     },
//                   );
//                 },
//               );
//             default:
//               return const Text('');
//           }
//         },
//       ),


//  leading: IconButton(
//           onPressed: () => GoRouter.of(context).pop(),
//           icon: const Icon(Icons.arrow_back),
//         ),
//         title: Text(title, style: const TextStyle(fontStyle: FontStyle.italic,),
// )
