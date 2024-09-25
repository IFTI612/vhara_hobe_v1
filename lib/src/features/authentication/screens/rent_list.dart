import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'rent_list_description.dart'; // Make sure to import the RentDescriptionPage

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
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 100,
                    height: 200, // Added height constraint for consistent image size
                    child: ClipRRect( // Added ClipRRect to clip overflowing parts
                      borderRadius: BorderRadius.circular(8), // Adjust corner radius as desired
                      child: Image.network(
                        data['imageUrl'],
                        fit: BoxFit.cover, // Maintain aspect ratio and cover the SizedBox
                        errorBuilder: (context, error, stackTrace) {
                          return Container( // Display placeholder or error message
                            color: Colors.grey[200],
                            child: Center(
                              child: Icon(Icons.error),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  title: Text(data['title'], style: TextStyle(fontSize: 20)),
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
