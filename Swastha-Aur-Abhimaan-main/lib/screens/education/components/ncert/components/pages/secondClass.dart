import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class SecondClass extends StatefulWidget {
  const SecondClass({Key? key}) : super(key: key);

  @override
  State<SecondClass> createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor:  Color.fromARGB(255, 138, 138, 138),
            tiColor: Colors.white,
            title: 'Class 2nd',
          )),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: ListView.builder(
            itemCount: first.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      openBookLink(Uri.parse(secondLinks[index]));
                    },
                    child: ListTile(
                        title: Text(first[index]!),
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 172, 172, 172),
                          child: Text(
                            first[index]![0],
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
