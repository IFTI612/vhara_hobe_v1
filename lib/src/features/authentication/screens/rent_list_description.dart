import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RentDescriptionPage extends StatelessWidget {
  final DocumentSnapshot document;

  RentDescriptionPage({required this.document});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data['imageUrl'] != null
                ? Image.network(data['imageUrl'])
                : Container(height: 200, color: Colors.grey),
            const SizedBox(height: 16.0),
            Text(
              data['title'],
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${data['price'].toStringAsFixed(2)} per month',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(data['description']),
            const SizedBox(height: 16.0),
            const Text(
              'Location:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(data['location']),
          ],
        ),
      ),
    );
  }
}
