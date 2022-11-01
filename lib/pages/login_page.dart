// ignore_for_file: prefer_const_literals_to_create_immutables
 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'forgot_pw_page.dart';
 
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  // const LoginPage({Key? key}) : super(key: key);
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}
 
class _LoginPageState extends State<LoginPage> {
 
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
 
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
      );
  }
 
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView (
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png',
                  scale: 3,
                  ),

                  // const SizedBox(height:5),
         
                  //hello children
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.bigShouldersInlineDisplay(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
         
                  
                ],
              ),

              const SizedBox(height:10),
         
                  Text(
                    "Please sign-in to your account",
                    style: GoogleFonts.bigShouldersText(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
         
                const SizedBox(height: 20),
         
              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 243),
                    border: Border.all(color: const Color.fromARGB(255, 235, 235, 235),
                    width: 3),
                    borderRadius: BorderRadius.circular(6),
                   ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username/ Email address",
                      ),
                    ),
                  ),
                ),
              ),
               
              const SizedBox(height:5),
         
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 243),
                    border: Border.all(color: const Color.fromARGB(255, 235, 235, 235),
                    width: 3),
                    borderRadius: BorderRadius.circular(6),
                   ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
         
              const SizedBox(height: 15),


              // forgot password? rest it now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot Password? ",
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: const Text(" Reset Here",
                        style: TextStyle(
                          color: Color.fromARGB(255, 145, 132, 229),
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                ],
              ),

              const SizedBox(height:10),
               
              //sign in button
              GestureDetector(
                onTap: signIn,
                child: Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 145, 132, 229),
                    border: Border.all(color: Colors.white,
                      width: 3),
                      borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text("Sign In",
                    style: TextStyle(color: Colors.white),
                    ),
                    ),
                ),
              ),

              const SizedBox(height: 20),


              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member? ",
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      ),
                      ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(" Register Now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 145, 132, 229),
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                ],
              ),
         
               
            ]),
          ),
        ),
      ),
 
 
      appBar: AppBar(
        title: Text(""),
      )
    );
  }
}
