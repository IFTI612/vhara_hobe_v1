import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentalList extends StatelessWidget {
  const RentalList({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference rentals = FirebaseFirestore.instance.collection('rentals');

    return StreamBuilder<QuerySnapshot>(
      stream: rentals.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Image.network(data['imageUrl'], width: 100, height: 60, fit: BoxFit.cover),
              title: Text(data['title']),
              subtitle: Text('\$${data['price'].toStringAsFixed(2)} per month',style: const TextStyle(color: Colors.black87),),
            );
          }).toList(),
        );
      },
    );
  }
}