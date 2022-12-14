import 'package:decisionlite/pages/addDecision.dart';
import 'package:decisionlite/pages/dashboard.dart';
import 'package:decisionlite/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

User? currUser = FirebaseAuth.instance.currentUser;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: Text('Clarity'),
        leading: Icon(Icons.person, size: 30,),
        title: Text(currUser!.displayName.toString()),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(CupertinoIcons.power))
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [Dashboard(), AddDecision()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Decision')
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade700,
        onTap: onTapped,
      ),
    );
  }
}
