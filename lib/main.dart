import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:search_screen_app/custom_title.dart';

import 'custom_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

final Color gradientColorStart = Color(0xff00b6f3);
final Color gradientColorEnd = Color(0xff0184dc);

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List userList = ['Sulochna Sahu'];
  String query = "";
  TextEditingController searchController = TextEditingController();

  searchAppBar(BuildContext context) {
    return NewGradientAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Colors.white,
        ),
        onPressed: () {
          // Navigator.of(context).pop();
        },
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: Colors.black,
            autofocus: true,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => searchController.clear());
                  },
                ),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color(0x88ffffff),
                )),
          ),
        ),
      ),
      gradient: LinearGradient(colors: [gradientColorStart, gradientColorEnd]),
    );
  }

  buildSuggestions(String query) {
    final List suggestionList = ["Sulochna Sahu"];

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        return CustomTile(
          mini: false,
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwAcm1Vx0KcqrYhR1cyjxdUT-phAbEh1Sskg&usqp=CAU"),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            "Sulochna Sahu",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "sulochnaSahu@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: searchAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: buildSuggestions(query),
      ),
    );
  }
}

