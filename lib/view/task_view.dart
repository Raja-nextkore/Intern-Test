import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  void updateCheckBox(String? id, bool? value) async {
    await FirebaseFirestore.instance.collection('task').doc(id).update({
      'isChecked': value,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('task')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title:
                          Text(data['isChecked'] ? data['plan'] : data['plan']),
                      trailing: Checkbox(
                        value: data['isChecked'],
                        onChanged: (bool? value) async {
                          String? id;
                          List idData = await FirebaseFirestore.instance
                              .collection('task')
                              .get()
                              .then((value) {
                            return value.docs;
                          });

                          setState(() {
                            id = idData[index].id;
                            updateCheckBox(id, value);
                          });
                        },
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
