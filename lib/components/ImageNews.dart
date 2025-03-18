import 'package:flutter/material.dart';

class ImageNews extends StatelessWidget {
  const ImageNews({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$url",
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
    );
  }
}
