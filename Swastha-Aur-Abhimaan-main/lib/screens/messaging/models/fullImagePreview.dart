import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class FullImagePreview extends StatefulWidget {
  final String imageUrl;
  final String sender;
  const FullImagePreview(
      {super.key, required this.imageUrl, required this.sender});

  @override
  State<FullImagePreview> createState() => _FullImagePreviewState();
}

class _FullImagePreviewState extends State<FullImagePreview> {
  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
        msg: 'Pinch to zoom in and out',
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 118, 118),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CustomAppBar(
          barColor: const Color.fromARGB(255, 99, 96, 96),
          title: widget.sender,
          tiColor: Colors.white,
        ),
      ),
      body: InteractiveViewer(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Center(
            child: Image.network(widget.imageUrl),
          ),
        ),
      ),
    );
  }
}
