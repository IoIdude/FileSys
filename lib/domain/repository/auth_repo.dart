abstract class AuthorizationRepository {
  Future<bool> loginIn(String _email);
  Future<bool> registration(
      String _email, int _user_code, int? _code, int? role_id);
}
