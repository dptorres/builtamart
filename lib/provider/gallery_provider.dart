import 'package:builtamart_flutter_exam/constants/constants_images.dart';
import 'package:builtamart_flutter_exam/models/user_state.dart';
import 'package:flutter/material.dart';

import 'builtamart_dbhelper.dart';

class GalleryProvider with ChangeNotifier {
  late final BuiltaMartDBHelper _helper;
  String _user = '';
  final List<String?> _carouselImages = BuiltaMartImages().initialCarouselImages;
  final List<String?> _tabAImages = BuiltaMartImages().initialTabAImages;
  final List<String?> _tabBImages = BuiltaMartImages().initialTabBImages;

  List<String?> get carouselImages => _carouselImages;
  List<String?> get tabAImages => _tabAImages;
  List<String?> get tabBImages => _tabBImages;
  BuiltaMartDBHelper get helper => _helper;
  String get user => _user;

  void setDBHelper(BuiltaMartDBHelper helper) {
    _helper = helper;
  }

  void setUser(String user) {
    _user = user;
    notifyListeners();
  }

  Future<void> initializeImageListNewUser() async {
    for (var image in BuiltaMartImages().initialTabAImages) {
      await _helper.insert(BuiltaMartDBHelper.TABLE_USER_STATE, {
        'user': _user,
        'tab': 'A',
        'image': image,
        'carousel': isImageInCarousel(image) ? 1 : 0
      });
    }

    for (var image in BuiltaMartImages().initialTabBImages) {
      await _helper.insert(BuiltaMartDBHelper.TABLE_USER_STATE, {
        'user': _user,
        'tab': 'B',
        'image': image,
        'carousel': isImageInCarousel(image) ? 1 : 0
      });
    }
    await loadSavedState();
  }

  Future<void> loadSavedState() async {
    await syncTabAImages();
    await syncTabBImages();
    await syncCarouselImages();
  }

  Future<void> syncCarouselImages() async {
    _helper.getCarouselImages(_user).then((value) {
      List<UserState> temp = value.map((e) => UserState.fromMap(e)).toList();
      _carouselImages.clear();
      _carouselImages.addAll(temp.map((e) => e.image!).toList());
      notifyListeners();
    });
  }

  Future<void> syncTabAImages() async {
    _helper.getTabImages(_user, 'A').then((value) {
      List<UserState> temp = value.map((e) => UserState.fromMap(e)).toList();
      _tabAImages.clear();
      _tabAImages.addAll(temp.map((e) => e.image!).toList());
      notifyListeners();
    });
  }

  Future<void> syncTabBImages() async {
    _helper.getTabImages(_user, 'B').then((value) {
      List<UserState> temp = value.map((e) => UserState.fromMap(e)).toList();
      _tabBImages.clear();
      _tabBImages.addAll(temp.map((e) => e.image!).toList());
      notifyListeners();
    });
  }

  void addToCarousel(String image) {
    _helper.updateItem(
        UserState(_user, isInTabA(image) ? 'A' : 'B', image, 1).toMap(),
        [_user, image]
    );
    syncCarouselImages();
  }

  void addToTabA(String image) {
    _helper.updateItem(
      UserState(_user, 'A', image, isImageInCarousel(image) ? 1 : 0).toMap(),
      [_user, image]
    );
    syncTabAImages();
    syncTabBImages();
  }

  void addToTabB(String image) {
    _helper.updateItem(
        UserState(_user, 'B', image, isImageInCarousel(image) ? 1 : 0).toMap(),
        [_user, image]
    );
    syncTabAImages();
    syncTabBImages();
  }

  void removeFromCarousel(String image) {
    _helper.updateItem(
        UserState(_user, isInTabA(image) ? 'A' : 'B', image, 0).toMap(),
        [_user, image]
    );
    syncCarouselImages();
  }

  bool isImageInCarousel(String image) {
    return _carouselImages.contains(image);
  }

  bool isInTabA(String image) {
    return _tabAImages.contains(image);
  }
}