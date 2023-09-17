import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/screens/bottom.dart';
import 'package:hackathon/screens/homeview3.dart';
// import 'package:hackathon/screens/mainhome.dart';
// import 'package:hackathon/screens/projects.dart';
import 'package:hackathon/screens/signupView.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email_control = TextEditingController();

  TextEditingController pass_control = TextEditingController();

  bool _obscureText = true;

  @override
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_control.text, password: pass_control.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(child: Icon(Icons.arrow_back_ios_new),onTap:(){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView3(),
                              ),
                            );} ,)),
                Text(
                  "Sign in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white, child: Icon(Icons.add)),
              ],
            ),
          ),
        ),
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
             
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: TextField(
                      controller: email_control,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintText: 'Enter Your email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email)),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: pass_control,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Enter Your Password',
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Toggle the value of _obscureText on button press
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      side: const BorderSide(width: 2, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      login(context);
                    },
                    child: Text("Sign in")),
              ),
              SizedBox(
                height: 45,
              ),Text("signin with"), 
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                          width: 80,
                          height: 70,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Icon(Icons.facebook,color: Colors.black,)
                          )), const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      width: 80,
                      height: 70,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {},
                        child: const Icon(
                          Icons.apple,
                          color: Colors.black,
                        ),
                      )),
                  ],
                ),
              ),SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  },
                  child: const Text("Not Register yet? Signup?"))
            ],
          ),
        ),
      ),
    );
  }
}
