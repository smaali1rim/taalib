import 'package:flutter/material.dart';

import '../main.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.person),
        ),
        hintText: 'Full name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.alternate_email),
        ),
        hintText: 'College E-mail',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.lock),
        ),
        hintText: 'Password',
      focusColor: Color(0xFFED3E53),

      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFED3E53),),borderRadius: BorderRadius.circular(32.0) ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
        },
        child: Text(
          "Sign up",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFED3E53),
            shape: StadiumBorder(),
            fixedSize: Size(150, 50)),
      ),
    );
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment(-1.1,0),
                child: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
                )),
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'Assets/img.png',
                scale: 1.5,
              ),
              SizedBox(
                height: 60,
              ),
              name,
              SizedBox(
                height: 20,
              ),
              email,
              SizedBox(
                height: 20,
              ),
              password,
              SizedBox(
                height: 20,
              ),
              signupButton,
            ],
          ),
        ),
      ),
    );
  }
}
