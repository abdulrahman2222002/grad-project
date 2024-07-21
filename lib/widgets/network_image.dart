
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageFromNetwork extends StatelessWidget {
  String? imageUrl;
  double? width;
  double? height;

  ImageFromNetwork({Key? key,  this.imageUrl, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      // height: height,
      width: width,
      fit: BoxFit.fill,
      key: Key(imageUrl??''),
      // placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => SizedBox(
          width: width, child: const Icon(Icons.error)),
    );
  }
}
