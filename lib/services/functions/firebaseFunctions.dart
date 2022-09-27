import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decisionlite/services/functions/authFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? currUser = FirebaseAuth.instance.currentUser;

saveDecision(Map pollsWeights, String title) async {
  await FirebaseFirestore.instance.collection('decisions').add({
    'pollWeights': pollsWeights,
    'pollerName' : FirebaseAuth.instance.currentUser!.displayName.toString(),
    'uid': currUser!.uid,
    'usersWhoVoted': {},
    'title': title,
  });
}
