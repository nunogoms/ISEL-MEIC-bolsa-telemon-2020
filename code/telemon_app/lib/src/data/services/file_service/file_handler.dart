import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class FileHandler<T> {

  late final String _fileName;

  void setFilename(String filename){
    this._fileName = filename;
  }

  Future<File> get localFile async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/$_fileName.csv');
  }

  void writeFile(T file) ;


}