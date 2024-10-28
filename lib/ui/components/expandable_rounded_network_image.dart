import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/animation_duration.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:transparent_image/transparent_image.dart';

class ExpandableRoundedNetworkImage extends StatefulWidget {
  final double size;
  final String imgUrl;
  final double expansionPercentage;
  final double borderThickness;

  const ExpandableRoundedNetworkImage(
    this.imgUrl, {
    super.key,
    this.size = Dimens.defaultImageSize,
    this.expansionPercentage = Dimens.defaultImageExpansionPercentage,
    this.borderThickness = Dimens.defaultImageBorderThickness,
  });

  @override
  State<ExpandableRoundedNetworkImage> createState() =>
      _ExpandableRoundedNetworkImageState();
}

class _ExpandableRoundedNetworkImageState
    extends State<ExpandableRoundedNetworkImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  bool isHovered = false;
  static const _rotationDuration = Duration(seconds: 4);

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: _rotationDuration,
      vsync: this,
    )..repeat();
  }

  double get _expandedSize =>
      widget.size + widget.size * widget.expansionPercentage;

  double get _dimension => isHovered ? _expandedSize : widget.size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(Size.square(_expandedSize)),
      alignment: Alignment.center,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        hitTestBehavior: HitTestBehavior.deferToChild,
        child: GestureDetector(
          onTap: () => _rotationController
              .animateBack(0.0, duration: AnimationDuration.standardDuration)
              .then((_) => _rotationController.repeat()),
          child: Stack(
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
                child: AnimatedContainer(
                  duration: AnimationDuration.intermediateDuration,
                  curve: Curves.decelerate,
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
                  padding: EdgeInsets.all(widget.borderThickness),
                  child: ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.imgUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
}
