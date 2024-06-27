import 'package:flutter/material.dart';
import 'package:task26/views/home_screen/home_screen.dart';
import 'package:task26/views/registration_screen/registraion_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.email, required this.password});
  final _formKey = GlobalKey<FormState>();
  final String email;
  final String password;
  TextEditingController _econtroller = TextEditingController();
  TextEditingController _pcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key:_formKey , 
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign in to Your Account ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _econtroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a email';
                    } else if (value.contains('@')) {
                      return null;
                    } else {
                      return 'enter a valid email id';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text('Your Email Address'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pcontroller,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'password must contain atleast 6 chars';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      label: Text('Your Password'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text('Remember Me'),
                    Spacer(),
                    Text('forgot password')
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     
                      if (_formKey.currentState!.validate()) {
                         if (_econtroller.text == email &&
                          _pcontroller.text == password) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                       
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an accound?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>RegistrationScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
