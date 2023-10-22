import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int current = 0;
  List images = [];
  List index = [];
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    getImages();
    // print('image length' + index[index.length - 1 - current].toString());
  }

  getImages() async {
    var images = await FirebaseFirestore.instance.collection('allImages').get();
    setState(() {
      this.images = images.docs;
    });
  }

  generateIndex() {
    for (int i = 0; i < images.length; i++) {
      setState(() {
        index.add(i);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          if (images.isEmpty) {
            return const Center(
              child: Text('There are no uploaded images',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: 'Lexend')),
            );
          } else {
            return CarouselSlider(
                options: CarouselOptions(
                  height: height * 0.25,
                  // viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      current = index;
                    });
                  }),
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ClipRRect(
                          child: Image.network(
                            image['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList());
          }
        }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
