import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/videoTileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool _isLoading = false;
  bool hasUserSearched = false;
  QuerySnapshot? videoSnapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.95,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: size.height * 0.07,
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 157, 135, 149),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.65,
                          child: TextField(
                            controller: searchController,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: size.width * 0.045),
                            decoration: InputDecoration(
                              hintText: 'Enter Subject',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: "Lexend",
                                  fontSize: size.width * 0.05),
                              border: InputBorder.none,
                            ),
                            autocorrect: true,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            searchVideo();
                          },
                          icon: Icon(
                            Icons.search,
                            size: size.width * 0.06,
                            color: Colors.white,
                          ),
                          hoverColor: const Color.fromARGB(255, 157, 135, 149)
                              .withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: Color.fromARGB(190, 191, 49, 49)),
                    )
                  : videoList()
            ],
          ),
        ),
      ),
    );
  }

  searchVideo() async {
    if (searchController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      await DatabaseService()
          .searchUploadedVideos(removeSpaceAndCapitalize(searchController.text))
          .then((snapshot) {
        setState(() {
          videoSnapshot = snapshot;
          _isLoading = false;
          hasUserSearched = true;
        });
      });
    } else {
      Container();
    }
  }

  videoList() {
    return hasUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: videoSnapshot!.docs.length,
            itemBuilder: (context, index) {
              return VideoTileModel(
                description: videoSnapshot!.docs[index]['description'],
                title: videoSnapshot!.docs[index]['title'],
                videoTag: videoSnapshot!.docs[index]['eduTag'],
                videoUrl: videoSnapshot!.docs[index]['videoUrl'],
              );
            })
        : Container();
  }

  removeSpaceAndCapitalize(String string) {
    String newString = string.trim();
    return newString[0].toUpperCase() + newString.substring(1);
  }
}
