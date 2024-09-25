import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rent_list_description.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{

  List _allResults=[];
  List _resultList=[];
  final TextEditingController _textEditingController= TextEditingController();

  @override
  void initState() {
    _textEditingController.addListener(_onSearchChanged);
    super.initState();
  }
  @override
  void dispose() {
    _textEditingController.removeListener(_onSearchChanged);
    _textEditingController.dispose();
    super.dispose();
  }
  _onSearchChanged(){
    print(_textEditingController.text);
    searchResultList();
  }

  searchResultList(){
    var showResults = [];
    if(_textEditingController.text!="")
      {
        for(var clientSnapShot in _allResults)
          {
            var location= clientSnapShot['location'].toString().toLowerCase();
            if(location.contains(_textEditingController.text.toLowerCase()))
              {
                showResults.add(clientSnapShot);
              }
          }
      }
    else{
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  getRentalStream() async{
    var data = await FirebaseFirestore.instance.collection('rentals').orderBy('location').get();

    setState(() {
      _allResults =data.docs;
    });
    searchResultList();
  }



  @override
  void didChangeDependencies() {
    getRentalStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CupertinoSearchTextField(
          controller: _textEditingController,
        ),
      ),
      /*body: ListView.builder(itemCount:_resultList.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(_resultList[index]['location'],),
              subtitle: Text(_resultList[index]['description'],),
              trailing: Text('${_resultList[index]['price'].toStringAsFixed(2)}/Mo',),
            );
      }),*/
      body: ListView.separated(
        itemCount: _resultList.length,
        separatorBuilder: (context, index) => SizedBox(height: 16), // Adjust the height as needed
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          DocumentSnapshot document = _resultList[index];
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

          return GestureDetector(
            onTap: () {
              // Navigate to the RentDescriptionPage and pass the document data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RentDescriptionPage(document: document),
                ),
              );
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
              child: ListTile(
                title: Text(data['location'], style: TextStyle(fontSize: 20)),
                subtitle: Text(data['description'],style: TextStyle(fontSize: 20)),
                trailing: Text(
                  '${data['price'].toStringAsFixed(2)}/Mo',
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}