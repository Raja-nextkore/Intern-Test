import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/input_field.dart';
import '../helper/main_button.dart';

class AddPlanView extends StatefulWidget {
  static const id = '/addPlanView';
  const AddPlanView({Key? key}) : super(key: key);

  @override
  State<AddPlanView> createState() => _AddPlanViewState();
}

class _AddPlanViewState extends State<AddPlanView> {
  final _planController = TextEditingController();
  bool isChecked = false;

  void addPlan() async {
    await FirebaseFirestore.instance.collection('task').add({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'plan': _planController.text,
      'isChecked': isChecked,
      'createdAt': Timestamp.now(),
    });
    _planController.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _planController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputFieldHelper(
              labelText: 'Add Task',
              controller: _planController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            MainButtonHelper(
                onPressed: () {
                  addPlan();
                },
                buttonText: 'Add Task'),
          ],
        ),
      ),
    );
  }
}
