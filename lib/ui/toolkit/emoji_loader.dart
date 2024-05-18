import 'package:flutter/material.dart';

class EmojiLoader extends StatelessWidget {
  const EmojiLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Offstage(
      // Insert invisible emoji in order to load the emoji font in CanvasKit
      // on startup. Magic stuff !!
      child: Text('🧑🏽‍💻🪄'),
    );
  }
}
