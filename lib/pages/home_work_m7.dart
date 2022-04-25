import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modul7_homework/dictionary/artist.dart';

class Modul7HomeWorkWidget extends StatefulWidget {
  Future<List<Artist>> artists;
  Modul7HomeWorkWidget({Key? key, required this.artists}) : super(key: key);

  @override
  State<Modul7HomeWorkWidget> createState() => _Modul7HomeWorkWidgetState();
}

class _Modul7HomeWorkWidgetState extends State<Modul7HomeWorkWidget> {
  String title = 'Artist info';
  String? name;
  String? info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(title, style: const TextStyle(fontStyle: FontStyle.italic)),
      ),
      endDrawer: Drawer(
        child: FutureBuilder(
          future: widget.artists,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return const LinearProgressIndicator();
              case ConnectionState.done:
                final artistList = snapshot.data as List<Artist>;
                return ListView.builder(
                  itemCount: artistList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(artistList[index].name),
                      onTap: () {
                        setState(() {
                          name = artistList[index].name;
                          info = artistList[index].info;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              default:
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Page Not found'),
                  ),
                );
            }
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: name == null
                  ? const Text('data1')
                  : Text(
                      'Music group name: $name',
                      style: const TextStyle(fontSize: 20),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: info == null ? const Text('data1') : Text(info!),
          )
        ],
      ),
    );
  }
}
