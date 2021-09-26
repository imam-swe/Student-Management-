import 'package:flutter/material.dart';
import 'package:i_school/screens/signinScreens/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:i_school/screens/studentScreens/studentpage.dart';
import 'package:i_school/screens/teacherScreens/teacherpage.dart';
import 'package:i_school/services/authService.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  late final bool users;
  LoginScreen(bool users) {
    this.users = users;
  }
  @override
  _LoginScreenState createState() => _LoginScreenState(users);
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late String email;
  late String password;
  late final bool users;
  _LoginScreenState(bool users) {
    this.users = users;
  }
  bool _isHidden = true;

  FirebaseAuth auth = FirebaseAuth.instance;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: 70,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                color: Color(0xffeae2b7),
                height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //Email
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.email),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                        ),

                        //Password
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              icon: const Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: const Icon(Icons.lock),
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              )),
                          obscureText: _isHidden,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 5) {
                              return 'invalid password';
                            }
                            return "Successfully Logged In!";
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),

//                         ElevatedButton(
//                           onPressed: () async {
//                             setState(() async {
//                               try {
//                                 if (email != "admin@a.com") {
//                                   await AuthService()
//                                       .signInWithEmailAndPassword(
//                                           email, password)
//                                       .then((value) => print("Signed in"));
// //                            await auth.signInWithEmailAndPassword(email: email, password: password);
//                                   if (users == true) {
//                                     Navigator.pushNamed(context, '/techer');
//                                   } else if (users == false) {
//                                     //Navigator.pushNamed(context, '/student');
//                                     //Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_page("p")));
//                                     Navigator.pushAndRemoveUntil(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 Student_page("p")),
//                                         (route) => false);
//                                   } else {
//                                     Navigator.pushNamed(context, '/admin');
//                                   }
//                                 } else {
//                                   await AuthService()
//                                       .signInWithEmailAndPassword(
//                                           email, password)
//                                       .then((value) => print("Signed in"));
//                                   Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => AdminPage()),
//                                       (route) => false);
//                                 }
//                                 //Navigator.pushNamed(context, '/admin');
//                               } catch (e) {
//                                 print(e);
//                               }
//                             });
//                           },
//                           child: Text("Log In"),
//                         ),

                        //ignore: deprecated_member_use
                        RaisedButton(
                          child: Text('login'),
                          onPressed: () async {
                            //_submit();
                            await auth.signInWithEmailAndPassword(
                                email: email, password: password);

                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           Student_page(widget.toString()),
                            //     ),
                            //     (route) => false);
                            if (users == true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Student_page(widget.toString()),
                                  ),
                                  (route) => false);
                            } else {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Teacher_page(widget.toString()),
                                  ),
                                  (route) => false);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        _createAccountLabel(),

                        _loginWithButton(),
                      ],
                    ),
                  ),
                ),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Dont have account?',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen(users)),
              );

              // Navigator.pushNamedAndRemoveUntil(context, (context)=>ChatRoom(), (route) => false)
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff0000FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginWithButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          SignInButton(
            Buttons.GoogleDark,
            // text: "Sign in with Google",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButton(
            Buttons.FacebookNew,
            // text: "Sign in with Facebook",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
