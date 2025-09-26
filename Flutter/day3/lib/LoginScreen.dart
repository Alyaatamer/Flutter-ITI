import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});


  @override
  State<StatefulWidget> createState() { 
      return _LoginScreen();
  }
}

class _LoginScreen extends State<Loginscreen>{

  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;


    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(title: Text(
                "Login",
                 style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                 ),
             ),
            centerTitle: true,
          ),
          body: Form(
              key: _formstate,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter Email Addess',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(
                           Icons.email,
                           color: Colors.blue,
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                   TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(
                           Icons.lock,
                           color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){  
                              setState(() {
                                 obscureText = !obscureText;
                              });
                          }, 
                          icon: obscureText
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          ),
                      ),
                      obscureText: obscureText,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter a Password';
                        }
                        else if (value.length<8){
                          return 'Please enter a Password atLeast 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                            _formstate.currentState!.validate();
                            final emailtext = _emailController.text;
                            final passwordtext = _passwordController.text;
                            print("The Email is $emailtext, and the Password is $passwordtext");
                        }, 
                        child: Text("Login"),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                          _emailController.text = "alyaa@gmai.com";
                          }, 
                          child: Text("Set")
                        ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            _emailController.clear();
                            _passwordController.clear();
                          }, 
                          child: Text("Clear")
                        ),
                    ),
                  ],
                ),
              ),
          ),
       );
  }
}