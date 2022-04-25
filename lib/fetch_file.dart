import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:modul7_homework/dictionary/artist.dart';

Future<List<Artist>> fetchFileFromAssetsToListArtist(String assetsPath) async {
  // var rowData = rootBundle.loadString(assetsPath).then((file) => file);

  // return Artist.fromJson(data as Map<String, dynamic>);

  final jsonData = await rootBundle.loadString(assetsPath);

  final list = jsonDecode(jsonData) as List<dynamic>;

  return list
      .map(
        (dynamic e) => Artist.fromJson(e as Map<String, dynamic>),
      )
      .toList();
}
