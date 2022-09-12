import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/view/home_view.dart';
import '../helper/input_field.dart';
import '../helper/main_button.dart';

class AddDetailsView extends StatefulWidget {
  const AddDetailsView({Key? key}) : super(key: key);

  @override
  State<AddDetailsView> createState() => _AddDetailsViewState();
}

class _AddDetailsViewState extends State<AddDetailsView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  addUserDetails(
    String firstName,
    String lastName,
    int age,
  ) async {
    User user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('users').add({
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': user.email,
      'createdAt': user.metadata.creationTime,
      'uid': user.uid,
    });
    Navigator.pushNamedAndRemoveUntil(context, HomeView.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputFieldHelper(
              labelText: 'First Name',
              controller: _firstNameController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputFieldHelper(
              labelText: 'Last Name',
              controller: _lastNameController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputFieldHelper(
              labelText: 'Age',
              controller: _ageController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            MainButtonHelper(
                onPressed: () {
                  addUserDetails(
                    _firstNameController.text.trim(),
                    _lastNameController.text.trim(),
                    int.parse(_ageController.text.trim()),
                  );
                },
                buttonText: 'Submit'),
          ],
        ),
      ),
    );
  }
}
