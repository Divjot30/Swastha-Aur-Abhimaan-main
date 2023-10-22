import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class TopResource extends StatelessWidget {
  const TopResource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return IconsAm(index: index);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class IconsAm extends StatelessWidget {
  IconsAm({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
          child: GestureDetector(
            onTap: () {
              _launchUrl(Uri.parse(resources[index]['link']));
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(
                resources[index][
                    'image'], // Image path of the icon to be displayed in the carousel
              ),
            ),
          ),
        ),
        Text(resources[index]['name']!,
            style: const TextStyle(
              fontSize: 12.0,
              fontFamily: 'Lexend',
            )),
      ],
    );
  }

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
