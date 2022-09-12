import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/view/addPlan_view.dart';
import '/view/login_view.dart';
import '/view/profile_view.dart';
import '/view/task_view.dart';

class HomeView extends StatefulWidget {
  static const id = '/homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  static const List<Widget> navBarView = [
    TaskView(),
    ProfileView(),
  ];

  void logOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushNamedAndRemoveUntil(context, LogInView.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Day Planner'),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: navBarView[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamed(context, AddPlanView.id);
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
