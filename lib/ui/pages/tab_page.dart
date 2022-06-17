import 'package:builtamart_flutter_exam/provider/gallery_provider.dart';
import 'package:builtamart_flutter_exam/ui/pages/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

import '../widgets/switches/tab_switch.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.tabName}) : super(key: key);

  final String tabName;

  @override
  TabPageState createState() => TabPageState();
}

void openSinglePhotoPage(BuildContext context, String image) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PhotoPage(image: image),
    )
  );
}

class TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    var tabImages = widget.tabName == 'a' ? context.watch<GalleryProvider>().tabAImages
        : context.watch<GalleryProvider>().tabBImages;

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: tabImages.length,
      itemBuilder: (context, index) {
        bool? isInCarousel = context.read<GalleryProvider>().isImageInCarousel(tabImages[index]);
        return FocusedMenuHolder(
          onPressed: () => openSinglePhotoPage(context, tabImages[index]),
          menuWidth: MediaQuery.of(context).size.width * 0.70,
          blurSize: 2.0,
          duration: const Duration(milliseconds: 150),
          animateMenuItems: true,
          blurBackgroundColor: Colors.black54,
          menuItemExtent: 70,
          menuItems: [
            FocusedMenuItem(
              title: TabSwitch(
                initialIndex: widget.tabName == 'a' ? 0 : 1,
                onToggle: (selectedIndex) {
                  if (selectedIndex == 0) {
                    context.read<GalleryProvider>().addToTabA(tabImages[index]);
                    context.read<GalleryProvider>().removeFromTabB(tabImages[index]);
                  } else {
                    context.read<GalleryProvider>().addToTabB(tabImages[index]);
                    context.read<GalleryProvider>().removeFromTabA(tabImages[index]);
                  }
                  Navigator.pop(context);
                },
              ),
              onPressed: (){},
            ),
            FocusedMenuItem(
              title: Expanded(
                child: StatefulBuilder(
                  builder: (context, setState) => CheckboxListTile(
                    title: const Text("Add to carousel"),
                    value: isInCarousel,
                    onChanged: (value) {
                      setState(() {
                        isInCarousel = value;
                      });
                      if (value!) {
                        context.read<GalleryProvider>().addToCarousel(tabImages[index]);
                      } else {
                        context.read<GalleryProvider>().removeFromCarousel(tabImages[index]);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              onPressed: (){},
            )
          ],
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(tabImages[index]),
              ),
            ),
          )
        );
      }
    );
  }
}
