import 'package:flutter/material.dart';
import 'package:simple_login_page/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String usernameErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 248, 208, 255),
              Color.fromARGB(255, 241, 160, 255),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Page",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 103, 103, 103),
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Enter your Username',
                    hintStyle: TextStyle(color: Colors.black38),
                    label: Text("Username"),
                    fillColor: Colors.white24,
                    focusColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a username';
                    }
                    if (value.length < 6 || value.length > 20) {
                      return 'Username must be between 6 to 20 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: Colors.black38),
                    label: Text("Password"),
                    fillColor: Colors.white24,
                    focusColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Password';
                    }
                    if (value.length < 6 || value.length > 20) {
                      return 'Password must be between 6 to 20 characters';
                    }
                    if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[a-zA-Z\d\W_]{8,20}$')
                        .hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
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
