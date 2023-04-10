import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:filesys/common/url_page.dart';
import 'package:filesys/data/model/full_data_user.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/data/repository_impl/role_impl.dart';
import 'package:filesys/data/repository_impl/user_impl.dart';
import 'package:filesys/domain/repository/role_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var getUsers = UserRepositoryImpl().show();
  int selectedValue = 1;
  bool _isValid = true;
  TextEditingController _userController = TextEditingController();

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
        title: Text('Пользователи'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        // width: 900,
        // height: 500,
        child: FutureBuilder<List<FullDataUser>>(
          future: getUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                (snapshot.data as List<FullDataUser>).length != 0) {
              return SingleChildScrollView(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: (snapshot.data as List<FullDataUser>).length,
                  itemBuilder: (BuildContext context, int index) {
                    var users = (snapshot.data as List<FullDataUser>)[index];
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 360,
                            child: Text(
                              users.email.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              users.role!.name.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () => showDialogUpd(
                                  users.email.toString(), users.role_id),
                              child: Text("Изменить")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () => deleteUser(users.id),
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

  void rolesPage() {
    print(134);
    Navigator.pushNamed(context, UrlPage.rolePage);
  }

  void usersPage() {
    Navigator.pushNamed(context, UrlPage.usersPage);
  }

  void showDialogUpd(String user_name, int? selectedValue) async {
    var roles = await RoleRepositoryImpl().show();
    _userController.text = user_name;

    // ignore: use_build_context_synchronously
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Изменение пользователя'),
        content: TextFormField(
          controller: _userController,
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
            labelText: 'Почта',
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          DropdownButton<int>(
            value: selectedValue,
            //style: TextStyle(color: Colors.red, fontSize: 30),
            items: roles
                .map(
                  (currency) => DropdownMenuItem(
                    child: Text(currency.name!),
                    value: currency.id,
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () =>
                    updateUser(user_name, _userController.text, selectedValue),
                child: const Text('Изменить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateUser(String db_email, String current_email, int? role_id) async {
    Navigator.pop(context);
    _userController.text = '';

    var edit_user =
        await UserRepositoryImpl().update(db_email, current_email, role_id);

    switch (edit_user) {
      case 'Вас нет в системе':
        {
          Navigator.pushNamed(context, UrlPage.authPage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(edit_user),
            ),
          );
          return;
        }
        break;
      case 'Вы не можете отредактировать сами свой аккаунт':
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(edit_user),
            ),
          );
          return;
        }
        break;
      case 'Ошибка редактирования':
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(edit_user),
            ),
          );
          return;
        }
        break;
    }

    getUsers = UserRepositoryImpl().show();

    setState(() {});
  }

  void deleteUser(int? id) async {
    var delete_user = await UserRepositoryImpl().delete(id);
    switch (delete_user) {
      case 'Вас нет в системе':
        {
          Navigator.pushNamed(context, UrlPage.authPage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(delete_user),
            ),
          );
          return;
        }
        break;
      case 'Вы не можете удалить сами свой аккаунт':
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(delete_user),
            ),
          );
          return;
        }
        break;
      case 'Ошибка удаления пользователя':
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(delete_user),
            ),
          );
          return;
        }
        break;
    }

    getUsers = UserRepositoryImpl().show();

    setState(() {});
  }

  void showDialogAdd() async {
    var roles = await RoleRepositoryImpl().show();
    // ignore: use_build_context_synchronously
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Добавление пользователя'),
        content: TextFormField(
          controller: _userController,
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
            labelText: 'Почта',
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          new DropdownButton<int>(
            value: selectedValue,
            //style: TextStyle(color: Colors.red, fontSize: 30),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: roles.map<DropdownMenuItem<int>>((Role currency) {
              return new DropdownMenuItem<int>(
                child: new Text(currency.name!),
                value: currency.id,
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => addUser(_userController.text, selectedValue),
                child: const Text('Добавить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addUser(String email, int role_id) async {
    Navigator.pop(context);
    _userController.text = '';

    var add_user = await UserRepositoryImpl().create(email, role_id);
    getUsers = UserRepositoryImpl().show();

    setState(() {});
  }
}

// class SelectorWidget extends StatefulWidget {
//   @override
//   _SelectorWidgetState createState() => _SelectorWidgetState();
// }

// class _SelectorWidgetState extends State<SelectorWidget> {
//   //Your String used for defining the selection**
//   String _currentSelection = "Wednesday";

//   //Your build method
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//           DropdownButton<int>(
//             value: selectedValue,
//             //style: TextStyle(color: Colors.red, fontSize: 30),
//             items: roles
//                 .map(
//                   (currency) => DropdownMenuItem(
//                     child: Text(currency.name!),
//                     value: currency.id,
//                   ),
//                 )
//                 .toList(),
//             onChanged: (value) {
//               setState(() {
//                 selectedValue = value!;
//               });
//             },
//           ),
//     );
//   }
// }
