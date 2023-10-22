import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/broadcastPage.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/broadcastListTile.dart';

class Broadcast extends StatefulWidget {
  const Broadcast({Key? key}) : super(key: key);

  @override
  State<Broadcast> createState() => _BroadcastState();
}

class _BroadcastState extends State<Broadcast> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: villageName.length,
      itemBuilder: (context, index) {
        return BroadcastListTile(
          page: BroadcastPage(
            title: villageName[index],
          ),
          title: villageName[index],
          subtitle: sub[index],
        );
      },
    );
  }
}
