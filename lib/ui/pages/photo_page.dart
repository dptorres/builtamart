import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/gallery_provider.dart';
import '../widgets/switches/tab_switch.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  PhotoPageState createState() => PhotoPageState();
}

class PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    int index = context.read<GalleryProvider>().isInTabA(widget.image) ? 0 : 1;
    bool? isInCarousel = context.read<GalleryProvider>().isImageInCarousel(widget.image);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.image),
              ),
            ),
          ),
          TabSwitch(
            initialIndex: index,
            onToggle: (selectedIndex) {
              if (selectedIndex == 0) {
                context.read<GalleryProvider>().addToTabA(widget.image);
                context.read<GalleryProvider>().removeFromTabB(widget.image);
              } else {
                context.read<GalleryProvider>().addToTabB(widget.image);
                context.read<GalleryProvider>().removeFromTabA(widget.image);
              }
            },
          ),
          CheckboxListTile(
            title: const Text("Add to carousel"),
            value: isInCarousel,
            onChanged: (value) {
              setState(() {
                isInCarousel = value;
              });
              if (value!) {
                context.read<GalleryProvider>().addToCarousel(widget.image);
              } else {
                context.read<GalleryProvider>().removeFromCarousel(widget.image);
              }
            },
          ),
        ],
      ),
    );
  }
}
