import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import 'package:todo_app/controller/auth_provider.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/screenui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff2DACEB),
                    Color(0xffBADDEE),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 47,
                    width: 115,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your password",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        Provider.of<AuthProvider>(context, listen: false)
                            .signInWithEmailAndPassword(_emailController.text,
                                _passwordController.text, context)
                            .then((value) {
                          if (value == true) {
                            _emailController.clear();
                            _passwordController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Logged in Successfully!',
                            );
                          }
                        });
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text: "Email or password can't be empty",
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("or"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignupUi()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Provider.of<AuthProvider>(context).isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
