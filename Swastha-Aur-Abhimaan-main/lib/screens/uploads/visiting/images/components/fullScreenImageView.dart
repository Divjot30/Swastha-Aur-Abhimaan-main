import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageLink;
  const FullScreenImageView({Key? key, required this.imageLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
            barColor: Color.fromRGBO(157, 135, 149, 1),
            title: 'Full Screen',
            tiColor: Colors.white),
      ),
      body: Center(
        child: Image.network(imageLink, fit: BoxFit.fitWidth),
      ),
    );
  }
}
