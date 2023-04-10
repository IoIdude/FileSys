// ignore_for_file: unnecessary_new
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filesys/common/url_page.dart';
import 'package:filesys/data/model/Files.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/role_path.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/data/repository_impl/path_impl.dart';
import 'package:filesys/data/repository_impl/role_impl.dart';
import 'package:filesys/data/repository_impl/user_impl.dart';
import 'package:filesys/domain/repository/role_repo.dart';
import 'package:filesys/presentation/admin/role_page.dart';
import 'package:filesys/presentation/auth/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:context_menus/context_menus.dart';

class HomePage extends StatefulWidget {
  final String? token;
  const HomePage({super.key, required this.token});
  @override
  State<StatefulWidget> createState() => _HomePageState(token: token);
}

class _HomePageState extends State<HomePage> {
  String? token;
  _HomePageState({required this.token});
  late String curr_path = '';
  late var getFiles;
  int cout_routes = 0;

  @override
  Widget build(BuildContext context) {
    List<String>? files;
    String curr_name;
    var user = UserRepositoryImpl().tokenUser(token);

    if (curr_path == '') {
      curr_path = '/';
    }
    print('curr_puth: ' + curr_path);
    getFiles = PathRepositoryImpl().getFiles(curr_path);

    return ContextMenuRegion(
      enableLongPress: false,
      // LinkContextMenu is an example menu, provided with this package
      contextMenu: LinkContextMenu(url: 'http://flutter.dev'),
      child: TextButton(onPressed: () {}, child: Text("http://flutter.dev")),
    );
  }

  void exit() async {
    Navigator.pop(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    //Navigator.pushNamed(context, UrlPage.authPage);
    Navigator.of(context).push(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AuthorizationPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void rolesPage() async {
    Navigator.pop(context);
    Navigator.pushNamed(context, UrlPage.rolePage);
  }

  void usersPage() async {
    Navigator.pop(context);
    Navigator.pushNamed(context, UrlPage.usersPage);
  }

  void openFolder(String dir) async {
    if (dir.contains('.')) {
      return;
    }
    var file_path = await PathRepositoryImpl().getFiles(dir);
    curr_path = file_path.current_folder!;

    setState(() {});
  }

  void back() async {
    var str = curr_path.split('/');
    Files file_path;

    if (str.length - 2 != 0) {
      file_path = await PathRepositoryImpl().getFiles(curr_path.replaceFirst(
          str[str.length - 1] + '/' + str[str.length - 2], ''));
    } else {
      file_path = await PathRepositoryImpl().getFiles('/');
    }
    curr_path = file_path.current_folder!;

    setState(() {});
  }
}
