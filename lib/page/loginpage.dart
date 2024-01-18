import 'package:cuoiki/components/mybutton.dart';
import 'package:cuoiki/components/mytextfield.dart';
import 'package:cuoiki/helper/helper_funtion.dart';
import 'package:cuoiki/page/forgotpw.dart';
import 'package:cuoiki/page/menu_page.dart';
import 'package:cuoiki/page/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 50),
              const Text(
                "LOG IN",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ForgorPassword();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuPage([]),
                      ));
                },
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don''t have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const Text(
                      "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
