import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:filesys/data/model/role.dart';

import '../../common/app_config.dart';
import '../../domain/repository/role_repo.dart';

class RoleRepositoryImpl implements RoleRepository {
  @override
  Future<bool> create(String _name) async {
    Map<String, dynamic> map = {'role_name': _name};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/create_role', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> delete(int? _id) async {
    Map<String, dynamic> map = {'id': _id};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/delete_role', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<List<Role>> show() async {
    final dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});
    Response response = await dio.get('${AppConfig.baseApiURL}/api/roles');

    if (response.statusCode == 200) {
      var data = response.data["roles"] as List;
      var roles = data.map((role) => Role.fromJson(role)).toList();

      return roles;
    }

    return [];
  }

  @override
  Future<bool> update(String _name, String _new_name) async {
    final Dio dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});

    Map<String, String> map = {'name': _name, 'new_name': _new_name};

    Response response =
        await dio.post('${AppConfig.baseApiURL}/api/edit_role', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<Role> getRoleByName(String _name) async {
    final dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});

    Map<String, String> map = {'name': _name};
    Response response =
        await dio.post('${AppConfig.baseApiURL}/api/role', data: map);

    if (response.statusCode == 200) {
      return Role.fromJson(response.data);
    }

    return new Role();
  }

  @override
  Future<Role> getRoleById(int? _id) async {
    final dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});

    Map<String, int?> map = {'id': _id};
    Response response =
        await dio.post('${AppConfig.baseApiURL}/api/role_by_id', data: map);

    if (response.statusCode == 200) {
      return Role.fromJson(response.data);
    }

    return new Role();
  }
}
