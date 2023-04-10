import 'package:dio/dio.dart';
import 'package:filesys/data/model/full_data_user.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/domain/repository/auth_repo.dart';
import 'package:filesys/common/app_config.dart';
import 'package:filesys/domain/repository/user_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> tokenUser(String? _token) async {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Authorization": "Bearer $_token",
        },
        validateStatus: (status) => true,
      ),
    );

    Response response = await dio.get('${AppConfig.baseApiURL}/api/user');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }

    return new User();
  }

  @override
  Future<String> delete(int? _id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    if (token != null) {
      var user = await UserRepositoryImpl().tokenUser(token);

      if (user == null) {
        sharedPreferences.remove("token");
        return 'Вас нет в системе';
      }

      if (user.id == _id) {
        return 'Вы не можете удалить сами свой аккаунт';
      }
    }

    Map<String, dynamic> map = {'id': _id};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/delete_user', data: map);

    if (response.statusCode == 200) {
      return 'Пользователь успешно удален';
    }

    return 'Ошибка удаления пользователя';
  }

  @override
  Future<List<FullDataUser>> show() async {
    final dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});
    Response response = await dio.get('${AppConfig.baseApiURL}/api/users');

    if (response.statusCode == 200) {
      var data = response.data["users"] as List;
      var users = data.map((user) => FullDataUser.fromJson(user)).toList();

      return users;
    }

    return [];
  }

  @override
  Future<String> update(String _email, String _new_email, int? role_id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    if (token != null) {
      var user = await UserRepositoryImpl().tokenUser(token);

      if (user == null) {
        sharedPreferences.remove("token");
        return 'Вас нет в системе';
      }

      if (user.email == _email) {
        return 'Вы не можете отредактировать сами свой аккаунт';
      }
    }

    final Dio dio = Dio();
    dio.options.headers.addAll({"Accept": "application/json"});

    Map<String, dynamic> map = {
      'email': _email,
      'new_email': _new_email,
      'role_id': role_id
    };

    Response response =
        await dio.post('${AppConfig.baseApiURL}/api/edit_user', data: map);

    if (response.statusCode == 200) {
      return 'Успешное редактирование';
    }

    return 'Ошибка редактирования';
  }

  @override
  Future<bool> create(String _email, int? role_id) async {
    Map<String, dynamic> map = {'email': _email, 'role_id': role_id};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/create_user', data: map);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<User> getUserByEmail(String? _email) async {
    Response response =
        await Dio().get('${AppConfig.baseApiURL}/api/user_by_email');

    if (response.statusCode == 200) {
      if (response.data != null) {
        return User.fromJson(response.data);
      }
    }

    return new User();
  }
}
