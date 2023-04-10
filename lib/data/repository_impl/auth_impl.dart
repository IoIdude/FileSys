import 'package:dio/dio.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/domain/repository/auth_repo.dart';
import 'package:filesys/common/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  @override
  Future<bool> loginIn(String _email) async {
    Map<String, dynamic> map = {'email': _email};

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/auth', data: map);

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setInt("code", response.data['code']);
      return true;
    }

    return false;
  }

  @override
  Future<bool> registration(
      String _email, int _user_code, int? _code, int? role_id) async {
    Map<String, dynamic> map = {
      'email': _email,
      'user_code': _user_code,
      'code': _code,
      'role_id': role_id
    };

    Response response =
        await Dio().post('${AppConfig.baseApiURL}/api/reg', data: map);

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove("code");

      await sharedPreferences.setString("token", response.data['token']);
      return true;
    }

    return false;
  }
}
