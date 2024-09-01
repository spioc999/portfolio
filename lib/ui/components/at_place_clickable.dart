import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AtPlaceClickable extends StatefulWidget {
  final String place;
  final String? link;
  final Function(String)? onLinkTap;
  final TextStyle? style;

  const AtPlaceClickable({
    super.key,
    required this.place,
    this.link,
    this.onLinkTap,
    this.style,
  });

  @override
  State<AtPlaceClickable> createState() => _AtPlaceClickableState();
}

class _AtPlaceClickableState extends State<AtPlaceClickable> {
  bool _onHoverPlace = false;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: widget.style,
        children: [
          const TextSpan(text: '@ '),
          TextSpan(
            text: widget.place,
            style: _onHoverPlace
                ? const TextStyle(decoration: TextDecoration.underline)
                : null,
            onEnter: (_) {
              if (widget.link != null) {
                setState(() => _onHoverPlace = true);
              }
            },
            onExit: (_) {
              if (widget.link != null) {
                setState(() => _onHoverPlace = false);
              }
            },
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (widget.link != null) {
                  widget.onLinkTap?.call(widget.link!);
                }
              },
          ),
        ],
      ),
    );
  }
}
