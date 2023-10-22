import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class SearchBar extends StatefulWidget {
  final String searchElement;
  const SearchBar({
    Key? key,
    required this.searchElement,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  bool hasUserSearched = false;
  QuerySnapshot? userSnapshot;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 166, 192, 254),
            Color.fromARGB(255, 246, 128, 132),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              cursorColor: const Color.fromARGB(255, 85, 84, 84),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lexend",
                  fontSize: size.width * 0.05),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: widget.searchElement,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            searchUser();
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }

  searchUser() async {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await DatabaseService()
          .searchUserByVillage(_searchController.text)
          .then((snapshot) {
        setState(() {
          userSnapshot = snapshot;
          isLoading = false;
          hasUserSearched = true;
        });
      });
    } else {
      Container();
    }
  }
}
