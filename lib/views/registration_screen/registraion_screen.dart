import 'package:flutter/material.dart';
import 'package:task26/views/login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
   
   RegistrationScreen({super.key});
   final _formKey = GlobalKey<FormState>();
   TextEditingController  _emailcontroller  =TextEditingController();
    TextEditingController  _passwordcontroller  =TextEditingController();
   TextEditingController  _confirmpasswordcontroller  =TextEditingController();
   
   

  @override
  Widget build(BuildContext context) {
    
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
          key:_formKey , 
            child: Column(
              children: [
                SizedBox(
                  height:20,
                ),
                Text(
                  'Sign Up for Free',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (value){
                    if (value==null || value.isEmpty) {
                      return 'enter a email';
                      
                    }else if( value.contains('@') ){
                      return null;
                    }else{
                      return 'enter a valid email id';
                        }},

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
                obscureText: true,
                controller: _passwordcontroller,
                
                validator: (value){
                if (value==null || value.length<6) {
                      return'password must contain atleast 6 chars';
                      
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
                  height: 20,
                ),
                TextFormField( obscureText: true,
                  controller: _confirmpasswordcontroller,
                  validator: (value) {
                  if (value==_passwordcontroller.text) {
                    return null;
                    
                  } else {
                    return 'password not match';

                    
                  }
                } ,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      label: Text('Your Confirm Password'),
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
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () { if (_formKey.currentState!.validate()) {
                        if (_confirmpasswordcontroller.text==_passwordcontroller.text) {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen(email: _emailcontroller.text, password: _passwordcontroller.text,)));
                          
                        }




                      }

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an accound?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                           
                        },
                        child: Text(
                          'Sign In',
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
