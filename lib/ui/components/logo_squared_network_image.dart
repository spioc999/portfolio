import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:transparent_image/transparent_image.dart';

class LogoSquaredNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double? size;
  final IconData? fallbackIcon;

  const LogoSquaredNetworkImage({
    super.key,
    required this.imgUrl,
    this.size,
    this.fallbackIcon,
  });

  const LogoSquaredNetworkImage.experience({
    super.key,
    required this.imgUrl,
    this.size,
  }) : fallbackIcon = Icons.business_outlined;

  const LogoSquaredNetworkImage.education({
    super.key,
    required this.imgUrl,
    this.size,
  }) : fallbackIcon = Icons.school_outlined;

  double get _effectiveSize => size ?? Dimens.defaultLogoSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: defaultBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            Dimens.defaultRadius - 1,
          ),
        ),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imgUrl,
          imageErrorBuilder: (_, __, ___) => SizedBox.square(
            dimension: _effectiveSize,
            child: Icon(fallbackIcon),
          ),
          fit: BoxFit.cover,
          width: _effectiveSize,
          height: _effectiveSize,
        ),
      ),
    );
  }
}
