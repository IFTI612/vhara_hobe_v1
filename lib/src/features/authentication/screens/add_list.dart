import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddRentalForm extends StatefulWidget {
  const AddRentalForm({super.key});

  @override
  _AddRentalFormState createState() => _AddRentalFormState();
}

class _AddRentalFormState extends State<AddRentalForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final _locationController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<String> uploadImage(File image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('rentals/${DateTime.now().millisecondsSinceEpoch}.jpg');
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<void> addRental(String imageUrl) {
    CollectionReference rentals =
        FirebaseFirestore.instance.collection('rentals');
    return rentals
        .add({
          'title': titleController.text,
          'uid': _auth.currentUser!.uid,
          'description': descriptionController.text,
          'price': double.parse(priceController.text),
          'location': _locationController.text,
          'imageUrl': imageUrl,
          'email': _auth.currentUser!.email,
        })
        .then((value) => print("Rental Added"))
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              _imageFile == null
                  ? const Text('No image selected!', style: TextStyle(fontWeight: FontWeight.bold),)
                  : Image.file(_imageFile!, height: 100, width: 100),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.image, color: Colors.white),
                    SizedBox(width: 16),
                    Text(
                      "Pick Image",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(2, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 50), // Hard-coding the size
                ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_box_outlined, color: Colors.white),
                    SizedBox(width: 16),
                    Text(
                      "Add Listing",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(2, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 50), // Hard-coding the size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
