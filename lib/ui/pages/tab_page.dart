
import 'package:builtamart_flutter_exam/ui/gallery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.tabName}) : super(key: key);

  final String tabName;

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends State<TabPage> {

  @override
  Widget build(BuildContext context) {
    var tabImages = widget.tabName == 'a' ? context.watch<GalleryProvider>().tabAImages
        : context.watch<GalleryProvider>().tabBImages;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: tabImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => print('open single photo page'),
            onLongPress: () => print('on long press'),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(tabImages[index]),
                ),
              ),
            ),
          );
        }
    );
  }

}