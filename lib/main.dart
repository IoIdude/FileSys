import 'dart:ffi';

import 'package:filesys/data/repository_impl/role_impl.dart';
import 'package:filesys/data/repository_impl/user_impl.dart';
import 'package:filesys/presentation/admin/home_page.dart';
import 'package:filesys/presentation/admin/role_page.dart';
import 'package:filesys/presentation/admin/users_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/url_page.dart';
import 'data/model/user.dart';
import 'presentation/auth/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    check: await checkAuth(),
    token: await getToken(),
  ));
}

class MyApp extends StatelessWidget {
  final bool check;
  final String? token;
  const MyApp({super.key, required this.check, required this.token});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: check ? UrlPage.homePage : UrlPage.authPage,
      routes: {
        UrlPage.authPage: (context) => AuthorizationPage(),
        UrlPage.rolePage: (context) => RolePage(),
        UrlPage.homePage: (context) => HomePage(token: token),
        UrlPage.usersPage: (context) => UsersPage()
      },
    );
  }
}

Future<String?> getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("token");
}

Future<bool> checkAuth() async {
  var token = await getToken();
  bool check = false;

  if (token != null) {
    var user = await UserRepositoryImpl().tokenUser(token);

    //var role = await RoleRepositoryImpl().getRoleByName('Admin');

    if (user != null) {
      // if (user.role_id == role.id) {
      //   check = true;
      // }
      check = true;
    }
  }

  return check;
}
