import 'package:flutter/material.dart';

import 'constants/constants_routes.dart';
import 'ui/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of yourØ application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuiltaMart Test App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(),
      routes: RouteMap,
    );
  }
}