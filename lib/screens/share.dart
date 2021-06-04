import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class ShareScreen extends StatelessWidget {
  final List quoteItems;
  final int index;
  const ShareScreen({Key? key, required this.quoteItems, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List _imageFile;
    ScreenshotController screenshotController = ScreenshotController();
    var item = quoteItems[index];
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito", brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "SHARE",
                  style: TextStyle(fontSize: 30, color: Colors.black12),
                ),
              ),
              Screenshot(
                controller: screenshotController,
                child: Container(
                  width: 300,
                  height: 400,
                  child: Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, offset: Offset(3, 1))
                            ]),
                        foregroundDecoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/${item['image']}.webp",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  child: Text(
                                    item['quote'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "--------- ${item['author']}  --------",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white60),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "ABHI",
                              style: TextStyle(color: Colors.white38),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        screenshotController
                            .capture()
                            .then((Uint8List? image) async {
                          if (image != null) {
                            final result = await ImageGallerySaver.saveImage(
                                Uint8List.fromList(image),
                                quality: 60,
                                name: "ABHI_" + DateTime.now().toString());
                            print(result);
                          }
                        }).catchError((onError) {
                          print(onError);
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          CupertinoIcons.download_circle,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          CupertinoIcons.share_solid,
                          color: Colors.white54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
