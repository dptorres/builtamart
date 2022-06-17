import 'package:builtamart_flutter_exam/ui/pages/photo_page.dart';
import 'package:flutter/material.dart';
import '../ui/pages/gallery_page.dart';
import '../ui/pages/login_page.dart';

const loginRoute = "login";
const galleryRoute = "gallery";
const photoRoute = "photo";

final RouteMap = {
  loginRoute: (context) => const LoginPage(),
  galleryRoute: (context) => const GalleryPage(),
};

final Map<String, Widget> widgetMap = {
  loginRoute: const LoginPage(),
  galleryRoute: const GalleryPage(),
};