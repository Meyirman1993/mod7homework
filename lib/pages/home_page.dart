import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    const draverKey = Key('value');
    return Scaffold(
      drawer: Drawer(
        key: draverKey,
        child: SafeArea(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  //GoRouter.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('Home page'),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push('/artistsPage');
                  Navigator.pop(context);
                },
                child: const Text('Artists'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Work Navigation page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}











      // endDrawer: Drawer(
      //   child: FutureBuilder(
      //     future: widget.artists,
      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.waiting:
      //           return const CircularProgressIndicator();
      //         case ConnectionState.active:
      //           return const LinearProgressIndicator();
      //         case ConnectionState.done:
      //           final artistList = snapshot.data as List<Artist>;
      //           return ListView.builder(
      //             itemCount: artistList.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return ListTile(
      //                 title: Text(artistList[index].name),
      //                 onTap: () {
      //                   setState(() {
      //                     name = artistList[index].name;
      //                     info = artistList[index].info;
      //                   });
      //                   Navigator.pop(context);
      //                 },
      //               );
      //             },
      //           );
      //         default:
      //           return Scaffold(
      //             appBar: AppBar(
      //               title: const Text('Page Not found'),
      //             ),
      //           );
      //       }
      //     },
      //   ),
      // ),
