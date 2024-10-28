import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:universal_html/html.dart' as html;

class FileService {
  void openAssetFile(String path) {
    html.window.open(Res.resolvePath(path), '_blank');
  }
}
