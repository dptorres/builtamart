
import 'package:builtamart_flutter_exam/ui/gallery_provider.dart';
import 'package:builtamart_flutter_exam/ui/pages/tab_page.dart';
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
    var carouselImages = context.watch<GalleryProvider>().carouselImages;
    var tabAImages = context.watch<GalleryProvider>().tabAImages;
    var tabBImages = context.watch<GalleryProvider>().tabBImages;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                itemCount: carouselImages.length,
                itemBuilder: (BuildContext context, int itemIndex, _) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            carouselImages[itemIndex]
                          )
                        )
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Tab A (${tabAImages.length})',),
                      Tab(text: 'Tab B (${tabBImages.length})',),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    TabPage(
                      tabName: 'a',
                    ),
                    TabPage(
                      tabName: 'b'
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}