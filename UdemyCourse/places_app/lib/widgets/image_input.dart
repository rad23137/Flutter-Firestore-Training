import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); // finding access location to store image in device
    final fileName = path.basename(imageFile.path); // finding name of image
    final savedImage = await File(imageFile.path).copy(
        '${appDir.path}/$fileName'); // copying the image in right location

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
          ),
        )
      ],
    );
  }
}
