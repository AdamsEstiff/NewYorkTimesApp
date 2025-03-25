import 'package:uuid/uuid.dart';

class MediaMetaData {
  String? id;
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetaData({this.id, this.url, this.format, this.height, this.width});

  MediaMetaData? getMetaData(List data) {

    List<MediaMetaData>? medias = data
        .map((object) => MediaMetaData(
        id: Uuid().v4(),
        url: object["url"],
        format: object["format"],
        height: object["height"],
        width: object["width"])).toList()
      ..sort((a, b) => (b.width! * b!.height!).compareTo(a.width! * a.height!));

    return medias.firstOrNull;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "url": url,
      "format": format,
      "height": height,
      "width": width,
    };
  }
}
