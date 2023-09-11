import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignupScreen extends StatefulWidget {
   SignupScreen({Key? key}) : super(key: key);




   @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _firstName = TextEditingController();

  TextEditingController _userName = TextEditingController();

  TextEditingController _confirmpassController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool _passwordsMatch = true;

  void msg(String msg)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future addUser(String firstname,String username,String email)
  async {
   await FirebaseFirestore.instance.collection('user').add({
     "FirstName": firstname,
     "UserName": username,
     "email": email

   });
 }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 140,
                ),
                const Text(
                  "Signup",
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _firstName,

                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:const BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "First Name",
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _userName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:const BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "Last Name",
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:const  BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "user email",
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),

                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "Enter your Password",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                 ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _confirmpassController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),

                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                    validator:  (confirmPassword) {
                if (confirmPassword != _passwordController.text) {
                 msg("Passwords do not match");
                }
                return null;
                },

                  ),
                ),
                
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 11, 56, 13,),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    onTap: ()  async {
                          if (formKey.currentState!.validate()) {
                      setState(() {
                  _passwordsMatch =_passwordController.text == _confirmpassController.text;
                });
                      print(_passwordsMatch);
                                }
                        if(_passwordsMatch) {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text).then((value) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) =>
                                    Text("Hello Entered")));
                            addUser(_firstName.text, _userName.text,
                                _emailController.text);
                          }).onError((error, stackTrace) {
                            msg(
                                "Please Enter All the fields or user already exist");
                          });
                        }


                         },
                 child: const Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                        print("Reigstration page is working");
                      },
                      child: Text(
                        "Click Here",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );

  }
}
