import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class TenthClass extends StatefulWidget {
  const TenthClass({Key? key}) : super(key: key);

  @override
  State<TenthClass> createState() => _TenthClassState();
}

class _TenthClassState extends State<TenthClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor:  Color.fromARGB(255, 138, 138, 138),
            tiColor:  Colors.white,
            title: 'Class 10th',
          )),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: size.height,
        child: ListView.builder(
            itemCount: seventh.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusNode().unfocus();
                      openBookLink(Uri.parse(tenthLinks[index]));
                    },
                    child: ListTile(
                        title: Text(seventh[index]!),
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 172, 172, 172),
                          child: Text(
                            sixth[index]![0],
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
