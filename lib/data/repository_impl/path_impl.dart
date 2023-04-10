import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesys/common/app_config.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/Files.dart';
import 'package:filesys/domain/repository/path_repo.dart';
import '../../data/model/type.dart';
import '../../data/model/role_path.dart';
import '../../data/model/path.dart';
//import 'package:easy_folder_picker/FolderPicker.dart';

class PathRepositoryImpl implements PathRepository {
  @override
  Future<bool> addFile() {
    // TODO: implement addFile
    throw UnimplementedError();
  }

  @override
  Future<bool> createFolder(String _route, int? role_id) async {
    Map<String, dynamic> map = {'route': _route, 'role_id': role_id};

    Response response = await Dio()
        .post('${AppConfig.baseApiURL}/api/create_folder', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> deleteFile(String path) async {
    Map<String, dynamic> map = {'path': path};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/delete_file', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> deleteFolder(String route) async {
    Map<String, dynamic> map = {'route': route};

    Response response = await Dio()
        .post('${AppConfig.baseApiURL}/api/delete_folder', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<Files> getFiles(String href) async {
    Map<String, dynamic> map = {'path': href};

    Response response =
        await Dio().get('${AppConfig.baseApiURL}/api/get_files', data: map);

    if (response.statusCode == 200) {
      var files = Files.fromJson(response.data);

      return files;
    }

    return new Files();
  }

  @override
  Future<bool> createFile(File file, String path) async {
    Map<String, dynamic> map = {'file': file, 'path': path};
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
      "path": path
    });
    Response response = await Dio()
        .post('${AppConfig.baseApiURL}/api/create_file', data: formData);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  void saveFile(String path, String? output_file) async {
    Map<String, dynamic> map = {'path': path};

    Response response = await Dio().download(
        '${AppConfig.baseApiURL}/api/save_file', output_file,
        data: map);
  }
}
