import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class ThirdClass extends StatefulWidget {
  const ThirdClass({Key? key}) : super(key: key);

  @override
  State<ThirdClass> createState() => _ThirdClassState();
}

class _ThirdClassState extends State<ThirdClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor:  Color.fromARGB(255, 138, 138, 138),
            tiColor:  Colors.white,
            title: 'Class 3rd',
          )),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: ListView.builder(
            itemCount: third.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      openBookLink(Uri.parse(thirdLinks[index]));
                    },
                    child: ListTile(
                        title: Text(third[index]!),
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 172, 172, 172),
                          child: Text(
                            third[index]![0],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        )),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
