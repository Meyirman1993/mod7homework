import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modul7_homework/dictionary/all_artist.dart';

import 'package:modul7_homework/pages/artist_list_widget.dart';
import 'package:modul7_homework/pages/home_page.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

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
          path: 'artistsPage',
          name: 'artistsPage',
          pageBuilder: (context, state) {
            // final artists = Artists.da;
            return MaterialPage(
              key: state.pageKey,
              child: ArtistsListWidget(list: Artists.rowData),
            );
          },
        ),
      ],
    ),
  ],
);
