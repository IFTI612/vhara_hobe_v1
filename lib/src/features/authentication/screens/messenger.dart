
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../repository/auth_repository/auth_repository.dart';
import '../screens/chatpage.dart';


class messenger extends StatefulWidget {
  const messenger({super.key});

  @override
  State<messenger> createState() => _messenger();
}

class _messenger extends State<messenger> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyanAccent,
              Colors.limeAccent,
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white10,
          title: Text('Messenger'),
        ),
        backgroundColor: Colors.transparent,
        body: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {

          if(snapshot.hasError){
            return const Text('Error');
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading');
          }

          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        },
    );

  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if(_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: data['email'],
                    receiverUserID: data['uid'],
                  ),
              ),
          );
        },
      );
    }
    else{
      return Container();
    }

  }
}