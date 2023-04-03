import 'package:attendance_tracker/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _signInKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  void LoginUser() {
    authService.SignInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hidepassword = true;
    return Material(
      child: Scaffold(
        backgroundColor: Vx.white,
        body: Form(
          key: _signInKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Icon(
                  CupertinoIcons.person,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(60),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
                          hintText: "Enter Email",
                          labelText: "Enter Email",
                        ),
                        onChanged: ((value) {}),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your Password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: hidepassword,
                        decoration: const InputDecoration(
                          fillColor: Vx.white,
                          iconColor: Vx.white,
                          prefixIcon: Icon(CupertinoIcons.lock_fill),
                          hintText: "Enter Password",
                          labelText: "Enter Password",
                        ),
                        onChanged: ((value) {}),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (_signInKey.currentState!.validate()) {
                            LoginUser();
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have Account ?",
                                style: TextStyle(fontSize: 16),
                              ),
                              InkWell(
                                child: const Text(
                                  " SignUp",
                                  style: TextStyle(
                                      fontSize: 18, color: Vx.blue200),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              SignUpPage())));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            child: Image.network(
                                'https://developers.google.com/static/identity/images/btn_google_signin_light_normal_web.png')),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() {
    authService.SignUpUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      Password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _signUpKey,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Vx.white,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 80,
              ),
              Icon(
                CupertinoIcons.person,
                size: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.person_alt),
                      hintText: "Enter Name",
                      labelText: "Enter Name",
                    ),
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.mail),
                      hintText: "Enter Email",
                      labelText: "Enter Email",
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your Password';
                      }
                      if (value.length < 4) {
                        return 'Your Password Must be 4 character';
                      }
                      return null;
                    },
                    obscureText: true
                    ,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.lock_fill),
                      hintText: "Enter Password",
                      labelText: "Enter Password",
                    ),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      if (_signUpKey.currentState!.validate()) {
                        signUpUser();
                      }
                    },
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have Account ?",
                            style: TextStyle(fontSize: 16),
                          ),
                          InkWell(
                            child: const Text(
                              " Login",
                              style: TextStyle(fontSize: 18, color: Vx.blue100),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
