import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/components/fullScreenImageView.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class AllImages extends StatefulWidget {
  final String date;
  final List imageLinks;
  const AllImages({Key? key, required this.date, required this.imageLinks})
      : super(key: key);

  @override
  State<AllImages> createState() => _AllImagesState();
}

class _AllImagesState extends State<AllImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CustomAppBar(
            barColor: const Color.fromARGB(255, 157, 135, 149),
            title: widget.date,
            tiColor: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.02),
        child: imageView(),
      ),
    );
  }

  imageView() {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: widget.imageLinks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            nextScreen(
                context,
                FullScreenImageView(
                  imageLink: widget.imageLinks[index],
                ));
          },
          child: Container(
            padding: EdgeInsets.all(size.width * 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.imageLinks[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
