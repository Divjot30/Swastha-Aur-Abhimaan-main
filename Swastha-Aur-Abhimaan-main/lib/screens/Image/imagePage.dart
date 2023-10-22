import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  bool isLoading = false;
  File? _image;
  String? downloadUrl;
  final imagePicker = ImagePicker();
  List images = [];
  final formKey = GlobalKey<FormState>();

  Future selectFromGallery() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar(
          context,
          Colors.red,
          const Text("No Image Selected"),
        );
      }
    });
  }

  Future selectFromCamera() async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar(
          context,
          Colors.red,
          const Text("No Image clicked"),
        );
      }
    });
  }

  @override
  void initState() {
    // 
    super.initState();
    getImages();
  }

  getImages() async {
    var image = await FirebaseFirestore.instance.collection('gallery').get();
    setState(() {
      images = image.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 91, 171, 226),
        title: const Text('Images'),
      ),
      body: GestureDetector(
        onLongPress: () {
          deleteImage();
        },
        child: Container(
          child: imageView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addImageWindow(context);
        },
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 91, 171, 226),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  addImageWindow(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Center(
                  child: Text(
                    'Add Image',
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontFamily: "Protrakt",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  thickness: 0.7,
                  endIndent: size.width * 0.1,
                  indent: size.width * 0.1,
                ),
              ],
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    selectFromGallery().whenComplete(() {
                      previewImage(context);
                      // DatabaseService().addImageUrl(downloadUrl!);
                    });
                  },
                  icon: Icon(
                    Icons.image,
                    size: size.width * 0.08,
                    color: const Color.fromARGB(255, 16, 86, 133),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    selectFromCamera().whenComplete(() {
                      previewImage(context);
                    });
                  },
                  icon: Icon(
                    Icons.camera,
                    size: size.width * 0.08,
                    color: const Color.fromARGB(255, 16, 86, 133),
                  ),
                ),
              ],
            ),
          );
        });
  }

  previewImage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Center(
                child: Text(
                  'Image Preview',
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontFamily: "Protrakt",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
                thickness: 0.7,
                endIndent: size.width * 0.1,
                indent: size.width * 0.1,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.file(_image!),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 175, 24, 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontFamily: "Protrakt",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          uploadImage().whenComplete(() {
                            // DatabaseService().addImageUrl(downloadUrl!);
                            showSnackBar(
                                context, Colors.green, "Image Uploaded");
                            Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 91, 171, 226),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontFamily: "Protrakt",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('post_$postID.jpg');
    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();
  }

  imageView() {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 91, 171, 226),
                    border: Border.all(
                      width: 8,
                      color: const Color.fromARGB(255, 91, 171, 226),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      images[index]['imageUrl'],
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
                thickness: 0.7,
                endIndent: size.width * 0.05,
                indent: size.width * 0.05,
              ),
            ],
          ),
        );
      },
    );
  }

  deleteImage() {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Center(
                  child: Text(
                    'Delete Image',
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontFamily: "Protrakt",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  thickness: 0.7,
                  endIndent: size.width * 0.1,
                  indent: size.width * 0.1,
                ),
              ],
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // DatabaseService().deleteImage();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: size.width * 0.08,
                    color: const Color.fromARGB(255, 16, 86, 133),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: size.width * 0.08,
                    color: const Color.fromARGB(255, 16, 86, 133),
                  ),
                ),
              ],
            ),
          );
        });
  }
//   addVideo() {
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//     }

//     DatabaseService().addVideoData(videoURL, videoTitle).then((value) {
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.pop(context);
//     });
//   }
}
