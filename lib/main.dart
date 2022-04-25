import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:modul7_homework/fetch_file.dart';

import 'package:modul7_homework/pages/home_page.dart';
import 'package:modul7_homework/pages/home_work_m7.dart';
import 'package:modul7_homework/pages/home_work_mod8.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'mainPage',
      pageBuilder: (context, state) =>
          MaterialPage(child: const HomePageWidget(), key: state.pageKey),
      routes: [
        GoRoute(
          path: 'm7Page',
          name: 'artistsPage',
          builder: (BuildContext context, GoRouterState state) {
            final rowData =
                fetchFileFromAssetsToListArtist('assets/artists.json');
            final artists = rowData;
            return Modul7HomeWorkWidget(
              artists: artists,
            );
          },
        ),
        GoRoute(
          path: 'm8Page',
          name: 'mod8hp',
          builder: (context, state) => Modul8HomeWorkWidget(),
        )
      ],
    ),
  ],
);
