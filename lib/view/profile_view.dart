import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                    //  color: Colors.grey,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.person),
                      ),
                      title: Text('${data['firstName']} ${data['lastName']}'),
                      subtitle: Text(data['email']),
                      trailing: Text(data['age'].toString()),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
