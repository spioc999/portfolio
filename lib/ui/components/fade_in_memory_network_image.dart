import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInMemoryNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Uint8List? placeholder;
  final Widget Function(BuildContext, Object, StackTrace?)? imageErrorBuilder;

  const FadeInMemoryNetworkImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.imageErrorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: placeholder ?? kTransparentImage,
      image: Res.resolvePath(image),
      imageErrorBuilder: imageErrorBuilder,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
