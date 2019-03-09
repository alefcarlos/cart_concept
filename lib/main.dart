import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/list_page.dart';

void main() async {
  ///
  /// Force the layout to Portrait mode
  /// 
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listagem de produtos',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: ListPage(),
    );
  }
}