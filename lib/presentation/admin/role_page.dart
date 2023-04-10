// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:filesys/common/url_page.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/data/repository_impl/role_impl.dart';
import 'package:filesys/data/repository_impl/user_impl.dart';
import 'package:filesys/domain/repository/role_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RolePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  var getRoles = RoleRepositoryImpl().show();
  bool _isValid = true;
  TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              child: IconButton(
            icon: const Icon(Icons.add_circle_outline_sharp),
            onPressed: () => {showDialogAdd()},
          ))
        ],
        centerTitle: true,
        title: Text('Роли'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        // width: 900,
        // height: 500,
        child: FutureBuilder<List<Role>>(
          future: getRoles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              (snapshot.data as List<Role>)
                  .removeWhere((element) => element.name == 'Admin');
            }

            if (snapshot.hasData && (snapshot.data as List<Role>).length != 0) {
              return SingleChildScrollView(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: (snapshot.data as List<Role>).length,
                  itemBuilder: (BuildContext context, int index) {
                    var roles = (snapshot.data as List<Role>)[index];
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 570,
                            child: Text(
                              roles.name.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () =>
                                  showDialogUpd(roles.name.toString()),
                              child: Text("Изменить")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () => deleteRole(roles.id),
                              child: Text("Удалить")),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void exit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    Navigator.pushNamed(context, UrlPage.authPage);
  }

  void showDialogAdd() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Добавление роли'),
        content: TextFormField(
          controller: _roleController,
          validator: (value) {
            if (!_isValid) {
              return null;
            }
            if (value!.isEmpty) {
              return 'Поле логин пустое';
            }
            if (value.length < 2) {
              return 'Логин должен содержать не менее 2 символов';
            }
            if (value.contains(RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$'))) {
              return 'Логин должен содержать минимум 1 цифру, 1 спец. символ, 1 строчную и 1 заглавную латинскую букву';
            }
            return null;
          },
          maxLength: 50,
          decoration: const InputDecoration(
            labelText: 'Имя роли',
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => addRole(_roleController.text),
                child: const Text('Добавить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addRole(String role_name) async {
    Navigator.pop(context);
    _roleController.text = '';

    var add_role = await RoleRepositoryImpl().create(role_name);
    getRoles = RoleRepositoryImpl().show();

    setState(() {});
  }

  void showDialogUpd(String role_name) {
    _roleController.text = role_name;
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Изменение роли'),
        content: TextFormField(
          controller: _roleController,
          validator: (value) {
            if (!_isValid) {
              return null;
            }
            if (value!.isEmpty) {
              return 'Поле логин пустое';
            }
            if (value.length < 2) {
              return 'Логин должен содержать не менее 2 символов';
            }
            if (value.contains(RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$'))) {
              return 'Логин должен содержать минимум 1 цифру, 1 спец. символ, 1 строчную и 1 заглавную латинскую букву';
            }
            return null;
          },
          maxLength: 50,
          decoration: const InputDecoration(
            labelText: 'Новое имя роли',
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => updateRole(role_name, _roleController.text),
                child: const Text('Изменить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateRole(String db_name, String current_name) async {
    Navigator.pop(context);
    _roleController.text = '';

    var edit_role = await RoleRepositoryImpl().update(db_name, current_name);
    getRoles = RoleRepositoryImpl().show();

    setState(() {});
  }

  void deleteRole(int? id) async {
    var delete_role = await RoleRepositoryImpl().delete(id);
    getRoles = RoleRepositoryImpl().show();

    setState(() {});
  }
}
