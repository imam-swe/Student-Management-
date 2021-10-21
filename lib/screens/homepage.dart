import 'package:flutter/material.dart';
// import 'package:i_school/users/userDetection.dart';
import 'package:i_school/screens/signinScreens/login_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool users = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2b7),
      // appBar: AppBar(
      //   title: Text(widget.title, style: TextStyle(fontSize: 28),),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/sms2.png',
                width: 160,
                height: 160,
                fit: BoxFit.fill,
              ),
              Text(
                'Student\nManagement\nSystem',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60.0,
              ),
              SizedBox(
                width: 180,
                height: 80,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    users = true;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(users)),
                    );
                    print(users);
                  },
                  child: Text(
                    'Student',
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 80,
                width: 180,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    // side: BorderSide(width: 3, color: Colors.orange),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    users = false;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(users)),
                    );
                    print(users);
                  },
                  child: Text(
                    'Teacher',
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
