import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/auth_provider.dart';
import 'package:quickalert/quickalert.dart';

class SignupUi extends StatefulWidget {
  const SignupUi({super.key});

  @override
  State<SignupUi> createState() => _SignupUiState();
}

class _SignupUiState extends State<SignupUi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/profile_icon.png",
                        width: 100,
                        height: 100,
                      ),
                      Text("Upload Photo"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "First name",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your first name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Middle name",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your middle name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Last name",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your last name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your email",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Re-Password",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm your password",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  _passwordController.text.isNotEmpty &&
                                  _confirmPasswordController.text.isNotEmpty) {
                                if (_passwordController.text ==
                                    _confirmPasswordController.text) {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .signUpWithEmailAndPassword(
                                          _emailController.text,
                                          _passwordController.text,
                                          context);
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Account created Successfully!',
                                  );
                                } else {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Oops...',
                                    text: "Password didn't match",
                                  );
                                }
                              } else {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  text: 'All fields are required',
                                );
                              }
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Provider.of<AuthProvider>(context).isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
