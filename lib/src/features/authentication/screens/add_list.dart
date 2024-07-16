import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRentalForm extends StatefulWidget {
  const AddRentalForm({super.key});

  @override
  _AddRentalFormState createState() => _AddRentalFormState();
}

class _AddRentalFormState extends State<AddRentalForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<String> uploadImage(File image) async {
    Reference storageReference = FirebaseStorage.instance.ref().child('rentals/${DateTime.now().millisecondsSinceEpoch}.jpg');
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<void> addRental(String imageUrl) {
    CollectionReference rentals = FirebaseFirestore.instance.collection('rentals');
    return rentals
        .add({
      'title': titleController.text,
      'uid' : _auth.currentUser!.uid,
      'description': descriptionController.text,
      'price': double.parse(priceController.text),
      'imageUrl': imageUrl,
    })
        .then((value) =>  print("Rental Added"))
        .catchError((error) => print("Failed to add rental: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Rental'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            _imageFile == null
                ? const Text('No image selected.')
                : Image.file(_imageFile!, height: 100, width: 100),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_imageFile != null) {
                  String imageUrl = await uploadImage(_imageFile!);
                  await addRental(imageUrl);
                  Navigator.pop(context);
                } else {
                  // Handle the case when no image is selected
                  print("No image selected");
                }
              },
              child: const Text('Add Rental'),
            ),
          ],
        ),
      ),
    );
  }
}