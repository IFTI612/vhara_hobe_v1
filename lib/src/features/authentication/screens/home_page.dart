import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/rent_list.dart';
import '../controllers/home_pageC.dart';
import 'add_list.dart';
import 'nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homeState();
}

class _homeState extends State<HomePage> {
  final homePageC home = Get.put(homePageC());

  // Add a state variable to hold the search query
  String _searchQuery = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 201, 188),
      drawer: const NavBar(),
      appBar: AppBar(
        shadowColor: Colors.white10,
        title: const Text("Home page"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white10,
              automaticallyImplyLeading: false,
              title: _searchBar('Search', home.search),
            ),
          ];
        },
        body: RentalList(searchQuery: _searchQuery), // Pass search query to RentalList
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRentalForm()),
          );
        },
      ),
    );
  }

  // Update search query as user types
  Widget _searchBar(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.brown, width: 1),
    );

    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      onChanged: (query) {
        setState(() {
          _searchQuery = query;  // Update the search query whenever the user types
        });
      },
      decoration: InputDecoration(
        icon: TextButton(
          onPressed: () {},
          child: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 26, 24, 24),
            size: 40,
          ),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
