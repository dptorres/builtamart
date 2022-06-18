import 'package:builtamart_flutter_exam/provider/builtamart_dbhelper.dart';
import 'package:builtamart_flutter_exam/provider/gallery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants_routes.dart';

void main() async {
  runApp(ChangeNotifierProvider<GalleryProvider>(
    child: const MyApp(),
    create: (_) => GalleryProvider(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Provider.of<GalleryProvider>(context, listen: false).setDBHelper(BuiltaMartDBHelper());
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuiltaMart Test App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: loginRoute,
      routes: RouteMap,
    );
  }
}


