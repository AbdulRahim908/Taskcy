import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/screens/loginView.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController semail_control = TextEditingController();

  TextEditingController spass_control = TextEditingController();

  bool _obscureText = true;

  void clearText() {
    semail_control.clear();
    spass_control.clear();
  }

  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semail_control.text,
        password: spass_control.text,
      );
      SnackBar(content: Text("User Added Successfully"));
      print("User Added Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              SizedBox(
                height: 100,
              ),
              Expanded(
                child: ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 253, 254, 254)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),Text("Sign up")
            ],
          ),
          SizedBox(
            height: 200,
          ),
          const Text(
            "Create Account",
            style: TextStyle(fontSize: 35),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SizedBox(
                width: 350,
                height: 80,
                child: TextField(
                  controller: semail_control,
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
              controller: spass_control,
              obscureText: true,
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
            height: 45,
          ),

          // GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Text("back")),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  side: const BorderSide(width: 2, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  signup(context);
                  clearText();
                },
                child: Text("signUp")),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              },
              child: Text("Already have an account Signin?"))
        ]),
      ),
    );
  }
}
