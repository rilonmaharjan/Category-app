import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ApiToLocal {
  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory!.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_json.dart');
  }

  Future readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<File> writeCounter(var data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$data');
  }
}
