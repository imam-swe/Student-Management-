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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/sms2.png',
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ),
              Text(
                'Student\nManagement\nSystem',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  //side: BorderSide(width: 3, color: Colors.orange),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  users = true;
                  setState(() {
                    users = users;
                    print(users);
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen(users)),
                  );
                },
                child: Text(
                  'Student',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  // side: BorderSide(width: 3, color: Colors.orange),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  users = false;
                  setState(() {
                    users = users;
                    print(users);
                  });
                  
                  // print(users);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen(users)),
                  );
                },
                child: Text(
                  'Teacher',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
