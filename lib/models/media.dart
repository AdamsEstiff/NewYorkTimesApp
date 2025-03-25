import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'metadata.dart';

class Media {
  String? id;
  String? type;
  String? subtype;
  String? caption;
  String? url;

  MediaMetaData? metaData;

  Media({this.id, this.type, this.subtype, this.caption, this.url});

  Media? getMedia(List media) {
    Map? content = media.lastOrNull;

    if (content != null) {
      metaData = MediaMetaData().getMetaData(content["media-metadata"]);
      return Media(
          id: Uuid().v4(),
          type: content["type"],
          subtype: content["subtype"],
          caption: content["caption"],
          url: metaData?.url)
        ..metaData = metaData;
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "subtype": subtype,
      "caption": caption,
      "url": url,
    };
  }
}
