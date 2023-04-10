import 'package:filesys/data/model/full_data_user.dart';
import 'package:filesys/data/model/user.dart';

abstract class UserRepository {
  Future<User> tokenUser(String? _token);
  Future<User> getUserByEmail(String? _email);
  Future<String> update(String _email, String _new_email, int? role_id);
  Future<String> delete(int? _id);
  Future<List<FullDataUser>> show();
  Future<bool> create(String _email, int? role_id);
}
