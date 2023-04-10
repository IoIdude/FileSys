// ignore_for_file: unnecessary_new
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
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
  bool _isValid = true;
  TextEditingController _folderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String>? files;
    String curr_name;
    var user = UserRepositoryImpl().tokenUser(token);

    if (curr_path == '') {
      curr_path = '/';
    }
    getFiles = PathRepositoryImpl().getFiles(curr_path);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () => {back()},
          )),
          Container(
              child: IconButton(
            icon: const Icon(Icons.note_add_outlined),
            onPressed: () => {createFile()},
          )),
          Container(
              child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {showDialogAdd()},
          ))
        ],
        centerTitle: true,
        title: Text(curr_path),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(children: [
        //Expanded(child: StyledMenuTests()),
        Container(
          // width: 900,
          // height: 500,
          child: FutureBuilder<Files>(
            future: getFiles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var count = (snapshot.data as Files).files!.length;

                files = (snapshot.data as Files).files;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(5),
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index) {
                    if (files![index].contains('.')) {
                      return Row(children: [
                        Container(
                            width: 670,
                            child: ListTile(
                                leading: const Icon(
                                    Icons.insert_drive_file_outlined),
                                //tooltip: 'Increase volume by 10',
                                onTap: () {
                                  setState(() {
                                    saveFile(files![index]);
                                  });
                                },
                                title: Text(files![index]
                                    .replaceFirst(curr_path, '')))),
                        ElevatedButton(
                            onPressed: () => {deleteFile(files![index])},
                            child: Text("Удалить")),
                      ]);
                    } else {
                      return Row(children: [
                        Container(
                          width: 670,
                          child: ListTile(
                              leading: const Icon(Icons.folder),
                              //tooltip: 'Increase volume by 10',
                              onTap: () {
                                setState(() {
                                  if (curr_path == '/') {
                                    openFolder(files![index]
                                            .replaceFirst(curr_path, '') +
                                        curr_path);
                                  } else {
                                    openFolder(curr_path +
                                        files![index]
                                            .replaceFirst(curr_path, '') +
                                        '/');
                                  }
                                });
                              },
                              title: Text(
                                  files![index].replaceFirst(curr_path, ''))),
                        ),
                        ElevatedButton(
                            onPressed: () => {deleteFolder(files![index])},
                            child: Text("Удалить")),
                      ]);
                    }
                  },
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
      ]),
      drawer: Drawer(
        width: 250,
        // ignore: unnecessary_new
        child: FutureBuilder<User>(
            future: user,
            builder: (context, snapshot) {
              //print((snapshot.data as User));
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue.shade300),
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.blue.shade200),
                        accountName: Text('Ваша почта:'),
                        accountEmail:
                            Text((snapshot.data as User).email.toString()),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ListTile(
                        title: new Text("Роли"),
                        leading: Icon(Icons.verified_user_outlined),
                        onTap: () {
                          rolesPage();
                        }),
                    ListTile(
                        title: new Text("Пользователи"),
                        leading: Icon(Icons.people_alt_outlined),
                        onTap: () {
                          usersPage();
                        }),
                    SizedBox(
                      height: 150,
                    ),
                    ListTile(
                        title: new Text("Выход"),
                        leading: Icon(Icons.arrow_back_ios_outlined),
                        onTap: () {
                          exit();
                        }),
                  ],
                );
              } else {
                return ListView(
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue.shade300),
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.blue.shade200),
                        accountName: Text('Ваша почта:'),
                        accountEmail: Text('…'),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ListTile(
                        title: new Text("Роли"),
                        leading: Icon(Icons.verified_user_outlined),
                        onTap: () {}),
                    ListTile(
                        title: new Text("Пользователи"),
                        leading: Icon(Icons.people_alt_outlined),
                        onTap: () {
                          usersPage();
                        }),
                    SizedBox(
                      height: 150,
                    ),
                    ListTile(
                        title: new Text("Выход"),
                        leading: Icon(Icons.arrow_back_ios_outlined),
                        onTap: () {
                          exit();
                        }),
                  ],
                );
              }
            }),
      ),
    );
  }

  void saveFile(String path) async {
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Папка для скачки',
      fileName: path.replaceFirst(curr_path, ''),
    );

    if (outputFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Папка не выбрана'),
        ),
      );
      return;
    }

    PathRepositoryImpl().saveFile(path, outputFile);
  }

  void createFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      var check = await PathRepositoryImpl()
          .getFiles(curr_path + file.path.split('/').last);
      if (check.files!.isEmpty) {
        PathRepositoryImpl().createFile(file, curr_path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Файл с таким именем уже есть в данной директории'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Файл не был выбран'),
        ),
      );
    }

    setState(() {});
  }

  void deleteFile(String path) async {
    if (curr_path == '/') {
      await PathRepositoryImpl().deleteFile(curr_path + path);
    } else {
      await PathRepositoryImpl().deleteFile(path);
    }
    setState(() {});
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
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

  void showDialogAdd() async {
    var roles = await RoleRepositoryImpl().show();
    int selectedValue = 1;
    // ignore: use_build_context_synchronously
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Добавление папки'),
        content: TextFormField(
          controller: _folderController,
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
            labelText: 'Имя папки',
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
                onPressed: () =>
                    addFolder(_folderController.text, selectedValue),
                child: const Text('Добавить'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addFolder(String route, int role_id) async {
    Navigator.pop(context);
    _folderController.text = '';

    if (curr_path == '/') {
      var check = await PathRepositoryImpl().getFiles(route);
      if (check.files!.isEmpty) {
        await PathRepositoryImpl().createFolder(route, role_id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Папка с таким именем уже есть в данной директории'),
          ),
        );
      }
    } else {
      var check = await PathRepositoryImpl().getFiles(curr_path + route);
      if (check.files!.isEmpty) {
        await PathRepositoryImpl().createFolder(curr_path + route, role_id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Папка с таким именем уже есть в данной директории'),
          ),
        );
      }
    }

    setState(() {});
  }

  void deleteFolder(String route) async {
    print(route);
    if (curr_path == '/') {
      await PathRepositoryImpl().deleteFolder(route);
    } else {
      await PathRepositoryImpl().deleteFolder(route);
    }
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
