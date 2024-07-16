import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyList extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    if (user == null) {
      return const Center(child: Text('User not logged in'));
    }
    final String currentUserId = user.uid;
    CollectionReference rentals = FirebaseFirestore.instance.collection('rentals');

    return Scaffold(
      appBar: AppBar(
        title: Text('My Listings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: rentals.where('uid', isEqualTo: currentUserId).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No rentals available'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                leading: data['imageUrl'] != null
                    ? Image.network(data['imageUrl'], width: 50, height: 50, fit: BoxFit.cover)
                    : const Icon(Icons.image, size: 50),
                title: Text(data['title']),
                subtitle: Text('\$${data['price'].toStringAsFixed(2)} per month'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
