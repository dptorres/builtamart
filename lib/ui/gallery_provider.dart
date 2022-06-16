import 'package:flutter/material.dart';

final List<String> initialCarouselImages = [
  'https://images.pexels.com/photos/2425251/pexels-photo-2425251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/5946969/pexels-photo-5946969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2187661/pexels-photo-2187661.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/707680/pexels-photo-707680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/634009/pexels-photo-634009.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

final List<String> initialTabAImages = [
  'https://images.pexels.com/photos/2425251/pexels-photo-2425251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/5946969/pexels-photo-5946969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2303781/pexels-photo-2303781.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/248444/pexels-photo-248444.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1571746/pexels-photo-1571746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

final List<String> initialTabBImages = [
  'https://images.pexels.com/photos/2187661/pexels-photo-2187661.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/707680/pexels-photo-707680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/634009/pexels-photo-634009.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/2091013/pexels-photo-2091013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/928971/pexels-photo-928971.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

class GalleryProvider with ChangeNotifier {
  final List<String> _carouselImages = initialCarouselImages;
  final List<String> _tabAImages = initialTabAImages;
  final List<String> _tabBImages = initialTabBImages;

  List<String> get carouselImages => _carouselImages;
  List<String> get tabAImages => _tabAImages;
  List<String> get tabBImages => _tabBImages;

  void addToCarousel(String image) {
    _carouselImages.add(image);
    notifyListeners();
  }

  void addToTabA(String image) {
    _tabAImages.add(image);
    notifyListeners();
  }

  void addToTabB(String image) {
    _tabBImages.add(image);
    notifyListeners();
  }

  void removeFromCarousel(String image) {
    _carouselImages.remove(image);
    notifyListeners();
  }

  void removeFromTabA(String image) {
    _tabAImages.remove(image);
    notifyListeners();
  }

  void removeFromTabB(String image) {
    _tabBImages.remove(image);
    notifyListeners();
  }

  bool isImageInCarousel(String image) {
    return _carouselImages.contains(image);
  }
}