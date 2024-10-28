import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:universal_html/html.dart' as html;

class FileService {
  Future<void> openAssetFile(String path) async {
    html.window.open(Res.resolvePath(path), '_blank');
  }
}
