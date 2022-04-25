// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {
  Artist({
    required this.name,
    required this.id,
    required this.info,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return _$ArtistFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ArtistToJson(this);
  }

  final String name;
  @JsonKey(name: 'link')
  final String id;
  @JsonKey(name: 'about')
  final String info;
}
