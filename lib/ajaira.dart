import 'package:flutter/material.dart';
//import 'package:i_school/screens/signinScreens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_school/screens/studentScreens/student_info.dart';
import 'package:i_school/screens/teacherScreens/teacher_info.dart';

// import 'package:i_school/screens/teacherScreens/teacherpage.dart';

// import 'package:i_school/users/userDetection.dart';
// import 'package:firebase_core/firebase_core.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  late final bool users;
  SignupScreen(bool users) {
    this.users = users;
  }

  @override
  _SignupScreenState createState() => _SignupScreenState(users);
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late final bool users;
  _SignupScreenState(bool users) {
    this.users = users;
    // setState(() {
    //   users = users;
    // });
  }

  bool _isHidden1 = true;

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  bool _isHidden2 = true;
  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
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
        centerTitle: true,
        // actions: <Widget>[
        //   // ignore: deprecated_member_use
        //   FlatButton(
        //     child: Row(
        //       children: <Widget>[Text('Login'), Icon(Icons.person)],
        //     ),
        //     textColor: Colors.white,
        //     onPressed: () {
        //       Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //     },
        //   ),
        // ],
      ),
      body: Center(
        // child: Card(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        child: Container(
          // height: 400,
          // width: 300,
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // //Name
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: 'Name'),
                  //   keyboardType: TextInputType.name,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter your name!';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (value) {
                  //     name = value;
                  //   },
                  // ),

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
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'invalid email!\nPlease try again with correct email address.';
                      }
                      //return null;
                      print(users);
                    },
                    onChanged: (value) {
                      email = value;
                      //print(users);
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
                          onTap: _togglePasswordView1,
                          child: Icon(
                            _isHidden1
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        )),
                    obscureText: _isHidden1,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length <= 5 && value.length > 20) {
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
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.lock),
                        ),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView2,
                          child: Icon(
                            _isHidden2
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        )),
                    obscureText: _isHidden2,
                    controller: _confirmPass,
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length <= 5 && value.length > 20) {
                        //return 'Enter Password from 6 to 20 characters';
                        print('Enter Password between 6 to 20 characters');
                      }
                      //return null;
                      if (value != _passwordController) {
                        print("Password Not Match");
                      }
                      //return null;
                    },
                    onChanged: (value) {
                      confirmpass = value;
                    },
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    width: 150,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () async {
                        //_submit();
                        await auth
                            .createUserWithEmailAndPassword(
                                //name: name,
                                email: email,
                                password: password)
                            .then((value) => {
                                  if (users == true)
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Student_Information(email),
                                        ),
                                        //(route) => false
                                      )
                                    }
                                  else
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Teacher_Information(email),
                                        ),
                                        //(route) => false
                                      )
                                    }
                                });
                        //print(email);

                        //     Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         // Teacher_Information(),
                        //         Student_Information(email),
                        //     // LoginScreen(users),
                        //   ),

                        // ),

                        print(users);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.orange,
                      textColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          color: Color(0xffeae2b7),
        ),
        //color: Colors.white,
      ),
    );
  }
}
