import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageDefaultWidget extends StatelessWidget {
  final ValueChanged<ImageSource> onClicked;

  const ImageDefaultWidget({Key? key, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = const Color.fromARGB(255, 106, 12, 122);

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: NetworkImage('https://i.stack.imgur.com/l60Hf.png')
              as ImageProvider,
          fit: BoxFit.cover,
          width: 160,
          height: 160,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;
              onClicked(source);
            },
          ),
        ),
      ),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.camera),
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Gallery'),
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.gallery),
                  )
                ],
              ));
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.browse_gallery),
              title: Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ),
      );
    }
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: color,
        all: 5,
        child: Icon(
          Icons.edit,
          size: 20,
        ),
      );
  Widget buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(16),
          color: color,
          child: child,
        ),
      );

}
