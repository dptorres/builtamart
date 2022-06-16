import 'package:flutter/material.dart';
import '../ui/pages/login_page.dart';

const loginRoute = "login";
const galleryRoute = "gallery";

final RouteMap = {
  loginRoute: (context) => const LoginPage(),
  // galleryRoute: (context) => GalleryPage(),
};

final Map<String, Widget> widgetMap = {
  loginRoute: const LoginPage(),
  // galleryRoute: GalleryPage(),
};