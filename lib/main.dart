import 'package:builtamart_flutter_exam/ui/gallery_provider.dart';
import 'package:flutter/material.dart';

import 'constants/constants_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<GalleryProvider>(
    child: const MyApp(),
    create: (_) => GalleryProvider(),
  ));
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
      initialRoute: galleryRoute,
      routes: RouteMap,
    );
  }
}