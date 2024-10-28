import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:universal_html/html.dart' as html;

class FileService {
  Future<void> downloadFile(String path, String fileName) async {
    final file = await compute(_fileFromPath, path);

    html.AnchorElement(href: file.path)
      ..download = fileName
      ..click();

    html.Url.revokeObjectUrl(file.path);
  }

  XFile _fileFromPath(String path) {
    return XFile(Res.resolvePath(path));
  }
}
