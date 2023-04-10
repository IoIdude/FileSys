import 'package:dio/dio.dart';
import 'package:filesys/common/app_config.dart';
import 'package:filesys/common/url_page.dart';
import 'package:filesys/data/model/role.dart';
import 'package:filesys/data/model/user.dart';
import 'package:filesys/data/repository_impl/auth_impl.dart';
import 'package:filesys/data/repository_impl/role_impl.dart';
import 'package:filesys/data/repository_impl/user_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../common/url_page.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;
  bool check = false;

  late int selectedValue;
  var roles = RoleRepositoryImpl().show();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Авторизация",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 15),
                child: TextFormField(
                  controller: _emailController,
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
              ),
              Padding(
                  padding: EdgeInsets.only(left: 100, right: 100, top: 15),
                  child: FutureBuilder<List<Role>>(
                    future: roles,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        (snapshot.data as List<Role>)
                            .removeWhere((element) => element.name == 'Admin');
                      }

                      if (snapshot.hasData &&
                          (snapshot.data as List<Role>).length != 0) {
                        selectedValue = (snapshot.data as List<Role>)[0].id!;
                        return DropdownButton<int>(
                          value: selectedValue,
                          //style: TextStyle(color: Colors.red, fontSize: 30),
                          items: (snapshot.data as List<Role>)
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
                        );
                      } else {
                        selectedValue = -1;
                        return DropdownButton<int>(
                          value: null,
                          disabledHint: Text('Нет ролей'),
                          //style: TextStyle(color: Colors.red, fontSize: 30),
                          items: null,
                          onChanged: null,
                        );
                      }
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 200, right: 200, top: 50),
                  child: Container(
                    width: 50,
                    child: ElevatedButton(
                      child: Text("Войти"),
                      onPressed: () => {
                        _isValid = true,
                        if (_key.currentState!.validate()) {authorize()}
                      },
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> authorize() async {
    try {
      bool result =
          await AuthorizationRepositoryImpl().loginIn(_emailController.text);
      if (result) {
        //_codeController.clear();

        showDialogCode();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Не правильно введен логин или пароль"),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  void showDialogCode() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Ввод кода'),
        content: TextFormField(
          controller: _codeController,
          validator: (value) {
            if (!_isValid) {
              return null;
            }
            if (value!.isEmpty) {
              return 'Поле пароль пустое';
            }
            if (value.length < 2) {
              return 'Пароль должен содержать не менее 2 символов';
            }
            if (value.contains(RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$'))) {
              return 'Пароль должен содержать минимум 1 цифру, 1 спец. символ, 1 строчную и 1 заглавную латинскую букву';
            }
            return null;
          },
          maxLength: 10,
          decoration: const InputDecoration(
            labelText: 'Код',
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
                onPressed: () => registration(int.parse(_codeController.text)),
                child: const Text('Отправить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> registration(int code) async {
    Navigator.pop(context);
    var check_user =
        await UserRepositoryImpl().getUserByEmail(_emailController.text);

    if (selectedValue == -1 && check_user == null) {
      _emailController.clear();
      _codeController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Авторизация на данный момент невозможна'),
        ),
      );

      return;
    }

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    print(_emailController.text);
    print(code);
    print(sharedPreferences.getInt("code"));
    print(selectedValue);
    try {
      bool result = await AuthorizationRepositoryImpl().registration(
          _emailController.text,
          code,
          sharedPreferences.getInt("code"),
          selectedValue);

      if (result) {
        _emailController.clear();
        _codeController.clear();

        Navigator.pushNamed(context, UrlPage.homePage);
      } else {
        _codeController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Неправильно введен логин или пароль"),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }
}
