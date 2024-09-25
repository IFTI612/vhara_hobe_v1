import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'rent_list_description.dart';

class RentalList extends StatelessWidget {
  final String searchQuery;

  const RentalList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    CollectionReference rentals = FirebaseFirestore.instance.collection('rentals');

    // Firestore query with search filter
    Query rentalsQuery = rentals;
    if (searchQuery.isNotEmpty) {
      rentalsQuery = rentals
          .where('title', isGreaterThanOrEqualTo: searchQuery)
          .where('title', isLessThanOrEqualTo: searchQuery + '\uf8ff');  // Efficient search
    }

    return StreamBuilder<QuerySnapshot>(
      stream: rentalsQuery.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView.separated(
          itemCount: snapshot.data!.docs.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

            return GestureDetector(
              onTap: () {
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
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 100,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        data['imageUrl'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  title: Text(data['title'], style: const TextStyle(fontSize: 20)),
                  subtitle: Text(
                    '${data['price'].toStringAsFixed(2)}/Mo',
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
