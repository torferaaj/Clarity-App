import 'package:decisionlite/auth/login.dart';
import 'package:decisionlite/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/Clarity-Logo.png'),height: 170,),
            // Container(
            //   child: Text(
            //     'Clarity',
            //     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(

                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Authenticate', style: TextStyle(fontSize: 18, color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
