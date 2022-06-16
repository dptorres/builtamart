
import 'package:builtamart_flutter_exam/ui/gallery_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {
    var _carouselImages = context.watch<GalleryProvider>().carouselImages;
    var _tabAImages = context.watch<GalleryProvider>().tabAImages;
    var _tabBImages = context.watch<GalleryProvider>().tabBImages;

    return Scaffold(
      body: SafeArea(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            itemCount: _carouselImages.length,
            itemBuilder: (BuildContext context, int itemIndex, _) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          _carouselImages[itemIndex]
                        )
                    )
                ),
              );
            },
          ),
      ),
    );
  }

}