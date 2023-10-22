import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/components/allImages.dart';

class VisitingImageTileModel extends StatelessWidget {
  final String description, visitVillage, visitDate;
  final List imageLinks;
  const VisitingImageTileModel(
      {Key? key,
      required this.description,
      required this.visitDate,
      required this.visitVillage,
      required this.imageLinks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: GestureDetector(
          onTap: () {
            nextScreen(
                context,
                AllImages(
                  date: visitDate,
                  imageLinks: imageLinks,
                ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'Assets/Logo/img.png',
                    width: size.width * 0.2,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    capitalizeText(visitVillage),
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontFamily: 'Lexend',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    capitalizeText(descriptionText(description)),
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Lexend',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    capitalizeText(visitDate),
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Lexend',
                      color: Colors.deepOrange[700],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  descriptionText(String description) {
    if (description.length > 20) {
      return '${description.substring(0, 20)}...';
    } else {
      return description;
    }
  }

  capitalizeText(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
