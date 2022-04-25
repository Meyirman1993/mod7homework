import 'package:modul7_homework/dictionary/artist.dart';
import 'package:modul7_homework/fetch_file.dart';

class Artists {
  static final rowData = fetchFileFromAssetsToListArtist('assets/artists.json');
  static final data = rowData as List<Artist>;

  static Artist artist(String ait) => data.artist(ait);
}

extension on List<Artist> {
  Artist artist(String ait) =>
      singleWhere((a) => a.id == ait, orElse: throw Exception());
}
