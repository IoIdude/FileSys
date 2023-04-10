import 'dart:io';

import 'package:filesys/data/model/Files.dart';

import '../../data/model/type.dart';
import '../../data/model/role_path.dart';
import '../../data/model/path.dart';

abstract class PathRepository {
  Future<bool> createFolder(String _route, int? role_id);
  //Future<bool> update(String _name, String _new_name);
  Future<bool> deleteFolder(String route);
  Future<bool> createFile(File file, String path);
  Future<bool> deleteFile(String path);
  Future<Files> getFiles(String href);
  void saveFile(String path, String? output_file);
}
