import 'package:decisionlite/services/functions/authFunctions.dart';
import 'package:decisionlite/utils/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var username = '';
  bool isLoginPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondary,
      // appBar: AppBar(
      //   backgroundColor: AppColors.secondary,
      //
      // ),
      body: Container(
        color: AppColors.secondary,
        padding: EdgeInsets.all(14),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: _formKey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('images/Clarity-Logo.png'),height: 170,),
                isLoginPage
                    ? Container()
                    : TextFormField(
                        style: const TextStyle(
                          color: Colors.white
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return 'Enter username';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('username'),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.white38
                          ),
                            labelText: 'Enter Username',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                            ),
                        ),
                      ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(
                    // backgroundColor: Colors.white,
                    color: Colors.white
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: const ValueKey('email'),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                        color: Colors.white38
                    ),
                      labelText: 'Enter Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white38)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)
                      ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(

                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Colors.white38
                    ),
                      labelText: 'Enter Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide())),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // print(email);
                            // print(password);
                            // print(username);
                            isLoginPage
                                ? signinUser(context, email, password)
                                : signupUser(context, email, password, username);
                          }
                        },
                        child: Text(isLoginPage ? 'Login' : 'Signup', style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(isLoginPage ? "Don't have account?   ":"Already have account?   "),
                          Text(isLoginPage ? 'Signup' : 'Login', style: TextStyle(color: Colors.white70),),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
