import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decisionlite/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.displayName.toString()=="_torfe_2412_");
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.8),
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            const Text(
              "Share your opinion here",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 8,),
            Divider(color: Colors.white,thickness: 0.2, indent: 8, endIndent: 8,),
            Expanded(
                child: Container(
              // color: Colors.red,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('decisions')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final docs = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            // print(docs.length);
                            // print(docs[index]['title']);
                            // print( docs[index]['uid']);
                            // print(docs[index]['pollWeights']);
                            // print(docs[index]['usersWhoVoted']);
                            // print(docs[index].id,);

                            return PollsWidget(
                                // username: docs[index]['username'],
                                decisionId: docs[index].id,
                                decisionTitle: docs[index]['title'],
                                pollerName: docs[index]['pollerName'],
                                creatorId: docs[index]['uid'],
                                pollWeights: docs[index]['pollWeights'],
                                usersWhoVoted: docs[index]['usersWhoVoted'],
                            );
                          },
                        );
                      }
                    },
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
