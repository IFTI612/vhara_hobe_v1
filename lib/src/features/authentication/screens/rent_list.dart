import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentalList extends StatelessWidget {
  const RentalList({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference rentals =
        FirebaseFirestore.instance.collection('rentals');

    return StreamBuilder<QuerySnapshot>(
      stream: rentals.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView.separated(
          itemCount: snapshot.data!.docs.length,
          separatorBuilder: (context, index) => SizedBox(height: 16), // Adjust the height as needed
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

            return Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ListTile(
                leading: SizedBox(
                  width: 100,
                  child: Image.network(data['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(data['title'], style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  '${data['price'].toStringAsFixed(2)}/Mo',
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            );
          },
        );

      },
    );
  }
}
