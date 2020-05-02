import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'types/sample.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final Database db = await getApplicationDocumentsDirectory().then(
      (documentDir) =>
          databaseFactoryIo.openDatabase(join(documentDir.path, 'shaharz')));
  var samples = StoreRef.main()
      .find(db)
      .then((data) => data
          .map((d) => d.value as Map)
          .map((d) => Sample.fromJson(d))
          .toList())
      .catchError(print);
  runApp(
    ShaharzInheritedWidget(
      appDirectory: appDirectory,
      db: db,
      child: MyApp(),
    ),
  );
}

class ShaharzInheritedWidget extends InheritedWidget {
  final Directory appDirectory;
  final Database db;

  ShaharzInheritedWidget({
    Key key,
    @required this.appDirectory,
    @required Widget child,
    @required this.db,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static ShaharzInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShaharzInheritedWidget>();
  }
}

enum Routes {
  app_home,
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ShaharzInheritedWidget i =
        ShaharzInheritedWidget.of(context);

    return MaterialApp(
        title: 'Makonaz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Text("shahrz"));
  }
}
