import 'package:path_provider/path_provider.dart';

Future<String> getFlowFeedPath(String name) async {
  return "${(await getApplicationCacheDirectory()).path}/$name";
}

Future<String> getFilePath() async {
  return await _getFilePath("m4a");
}

String _filepath = "";

Future<String> _getFilePath(String extension) async {
  if (_filepath.isEmpty) {
    final tempDir = await getApplicationCacheDirectory();
    _filepath = "${tempDir.path}/my_journal";
  }

  return "$_filepath.$extension";
}
