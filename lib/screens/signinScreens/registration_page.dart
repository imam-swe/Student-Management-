import 'package:flutter/material.dart';
import 'package:i_school/screens/signinScreens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:i_school/users/userDetection.dart';
// import 'package:firebase_core/firebase_core.dart';

class SignupScreen extends StatefulWidget {
  late final bool users;
  SignupScreen(bool users) {
    this.users = users;
  }
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final bool users;
  SignupScreen(bool users) {
    this.users = users;
  }

  final auth = FirebaseAuth.instance;
  late String name;
  late String email;
  late String password;
  late String confirmpass;

  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2b7),
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Row(
              children: <Widget>[Text('Login'), Icon(Icons.person)],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 400,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //Name
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                        ),

                        //Email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'invalid email!\nPlease try again with correct email address.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                        ),

                        //Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length <= 3 ||
                                value.length >= 50) {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                        ),

                        //Confirm Password
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          controller: _confirmPass,
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 3) {
                              return 'Password Empty';
                            }
                            //return null;
                            if (value != _passwordController) {
                              return "Password Not Match";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            confirmpass = value;
                          },
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          child: Text('submit'),
                          onPressed: () async {
                            //_submit();
                            await auth
                                .createUserWithEmailAndPassword(
                                    //name: name,
                                    email: email,
                                    password: password)
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen(users))));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}