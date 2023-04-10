import 'package:dio/dio.dart';

import '../../data/model/role.dart';

abstract class RoleRepository {
  Future<bool> create(String _name);
  Future<bool> update(String _name, String _new_name);
  Future<bool> delete(int? _id);
  Future<List<Role>> show();
  Future<Role> getRoleByName(String _name);
  Future<Role> getRoleById(int? _id);
}
