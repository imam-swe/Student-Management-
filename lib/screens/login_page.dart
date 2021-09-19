import 'package:flutter/material.dart';
import 'package:i_school/screens/homepage.dart';
import 'package:i_school/screens/registration_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String email;
  late String password;
  bool _isHidden = true;

  get auth => null;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.black, Colors.black54])),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                //color: Color(0xffD4F1F4),
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
                              // suffixIcon: const Padding(
                              //   padding: const EdgeInsets.only(top: 15.0),
                              //   child: const Icon(Icons.visibility_off),
                              // ),
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
                            if (value!.isEmpty || value.length <= 7) {
                              return 'invalid password';
                            }
                            return "Successfully Logged In!";
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          child: Text('submit'),
                          onPressed: () async {
                            //_submit();
                            await auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                          title: '',
                                        )),
                                (route) => false);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                        _createAccountLabel(),

                        //_loginWithButton(),
                      ],
                    ),
                  ),
                ),
              ),
              color: Colors.white,
            ),
          ),
          // Row(
          //   children: [
          //     Text('sdfgh', style: TextStyle(),),
          //   ],
          // ),
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
            'Don\'t have an account ?',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
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
          SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
            onPressed: () {},
          ),
          SignInButton(
            Buttons.Facebook,
            text: "Sign up with Facebook",
            onPressed: () {},
          ),
          SignInButton(
            Buttons.GitHub,
            text: "Sign up with GitHub",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
