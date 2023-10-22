import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/components/imageUploadPanel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/components/visitingImageTileModel.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class VisitingImage extends StatefulWidget {
  const VisitingImage({Key? key}) : super(key: key);

  @override
  State<VisitingImage> createState() => _VisitingImageState();
}

class _VisitingImageState extends State<VisitingImage> {
  List images = [];

  @override
  void initState() {
    super.initState();
    getImages();
  }

  getImages() async {
    await FirebaseFirestore.instance
        .collection('uploadPhotos')
        .where('label', isEqualTo: 'visit')
        .get()
        .then((value) {
      setState(() {
        images = value.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
            barColor: Color.fromARGB(255, 157, 135, 149),
            title: 'Visiting Images',
            tiColor: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              context: context,
              builder: ((context) {
                return const ImageUploadPanel();
              }));
        },
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: imageView(),
      ),
    );
  }

  imageView() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return VisitingImageTileModel(
            description: images[index]['description'],
            visitDate: images[index]['visitDate'],
            visitVillage: images[index]['visitVillage'],
            imageLinks: images[index]['imageUrl'],
          );
        });
  }
}
