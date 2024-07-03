import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_pageC.dart';
import 'nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homeState();
}

class _homeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var c = Get.put(homePageC());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 163, 201, 188),
              Colors.transparent,
            ]),
      ),
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 163, 201, 188),
          drawer: const NavBar(),
          appBar: AppBar(
            shadowColor: Colors.white10,
            title: const Text("app bar"), //size box diye korle valo
          ),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white10,
                  automaticallyImplyLeading: false,
                  title: //Text('App Bar 2'),

                  _searchBar('Search', Get
                      .find<homePageC>()
                      .search),

                ),
              ];
            },
            body: Container(
              child: _page(),
            ),
          )

      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _listings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 1));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: TextButton(onPressed: () {},
          child: Icon(
            Icons.search, color: Color.fromARGB(255, 26, 24, 24), size: 40,
          ),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,

      ),
    );
  }

  Widget _listings() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 231, 255, 251),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Test.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 Bedroom 2 Bathroom Apartment',
                      style: TextStyle(fontFamily: 'Franklin', fontSize: 16,color:Colors.black87), softWrap: true),
                  Text('Type: Apartment', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Size: 1200 SF', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Description: Lorem Ipsum Lorem Ipsum', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87),),
                  SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.black87,
                    ),
                    child: Text('25000/Mo', style: TextStyle(fontFamily: 'Raleway', fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Test.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 Bedroom 2 Bathroom Apartment',
                      style: TextStyle(fontFamily: 'Franklin', fontSize: 16,color:Colors.black87), softWrap: true),
                  Text('Type: Apartment', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Size: 1200 SF', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Description: Lorem Ipsum Lorem Ipsum', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87),),
                  SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.black,
                    ),
                    child: Text('25000/Mo', style: TextStyle(fontFamily: 'Raleway', fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Test.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 Bedroom 2 Bathroom Apartment',
                      style: TextStyle(fontFamily: 'Franklin', fontSize: 16,color:Colors.black87), softWrap: true),
                  Text('Type: Apartment', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Size: 1200 SF', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87)),
                  Text('Description: Lorem Ipsum Lorem Ipsum', style: TextStyle(fontFamily: 'Raleway', fontSize: 12,color:Colors.black87),),
                  SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.black,
                    ),
                    child: Text('25000/Mo', style: TextStyle(fontFamily: 'Raleway', fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
                  )
                ],
              )
            ],
          ),

        ],

      ),
    );
  }

}