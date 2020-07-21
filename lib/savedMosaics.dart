import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:mi_card/buyShirt.dart';
import 'package:mi_card/guestGrid1.dart';
import 'package:mi_card/intro.dart';

var imageName;

class SavedMosaics extends StatelessWidget {
  Widget makeImagesGrid() {
    return GridView.builder(
        itemCount: imageNum,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ImageGridItem(index + 1);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Mosaic Gallery',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        body: makeImagesGrid(),
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {
  int _index;

  ImageGridItem(int index) {
    this._index = index;
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  List<int> requestedIndexes = [];
  Map<int, Uint8List> imageData = {};

  Uint8List imageFile;

  StorageReference photosReference =
      FirebaseStorage.instance.ref().child('mosaics/users/$id');

  getImage() {
    if (!requestedIndexes.contains(widget._index)) {
      int MAX_SIZE = 7 * 1024 * 1024;
      photosReference
          .child('${widget._index}.png')
          .getData(MAX_SIZE)
          .then((data) {
        this.setState(() {
          imageFile = data;
        });
        imageData.putIfAbsent(widget._index, () {
          return data;
        });
      }).catchError((error) {
        debugPrint(error.toString());
      });
      requestedIndexes.add(widget._index);
    }
  }

  Widget decideGridTileViewWidget() {
    if (imageFile == null) {
      return Center();
    } else {
      return Material(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Image.memory(
            imageFile,
            fit: BoxFit.fitHeight,
          ),
        ),
        elevation: 10.0,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget._index)) {
      getImage();
    } else {
      this.setState(() {
        imageFile = imageData[widget._index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    for(int i=0; i<requestedIndexes.length; i++){return Container(
        child: InkResponse(
          child: GridTile(child: decideGridTileViewWidget()),
          onTap: () {
            if (imageFile == null) {
              print('Empty container');
            } else {
              imageName = widget._index;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    content: new Text('Transform mosaic into a shirt?',
                        style: TextStyle(
                            fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("Yes",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyShirt()),
                          );
                        },
                      ),
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("No",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ));}
  }
}
