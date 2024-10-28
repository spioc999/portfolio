import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/animation_duration.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';

class PersonalRoundedImages extends StatefulWidget {
  const PersonalRoundedImages({super.key});

  @override
  State<PersonalRoundedImages> createState() => _PersonalRoundedImagesState();
}

class _PersonalRoundedImagesState extends State<PersonalRoundedImages>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  bool isHovered = false;
  static const _gradientBorderThickness = 5.0;
  static const _rotationDuration = Duration(seconds: 5);
  static const _switchingImagesDuration = Duration(seconds: 2);

  late Timer _switchingImagesTimer;
  final _images = Me.imagesAndBlurHashs;
  late int _imageIndex;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: _rotationDuration,
      vsync: this,
    )..repeat();

    _imageIndex = Random().nextInt(_images.length);
    _switchingImagesTimer = Timer.periodic(_switchingImagesDuration, (_) {
      setState(() => _imageIndex = (_imageIndex + 1) % _images.length);
    });
  }

  double get _dimension =>
      isHovered ? Dimens.imageSize + Dimens.largeMargin : Dimens.imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(
        const Size.square(Dimens.imageSize + Dimens.veryLargeMargin),
      ),
      alignment: Alignment.center,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Stack(
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
              child: AnimatedContainer(
                duration: AnimationDuration.intermediateDuration,
                width: _dimension,
                height: _dimension,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.tertiaryContainer,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(_gradientBorderThickness),
                child: ClipOval(
                  child: Image.network(
                    _images[_imageIndex].img, //TODO add blur hash
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _switchingImagesTimer.cancel();
    super.dispose();
  }
}
