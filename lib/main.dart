import 'package:flutter/material.dart';
import 'package:taalib/Screens/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ThemeData().colorScheme.copyWith(primary: Color(0xFFED3E53),),
        primaryColor: Color(0xFFED3E53),focusColor: Color(0xFFED3E53),),
      home: Scaffold(
        body: SafeArea(child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool start = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 800)).then((value) {
      setState(() {
        start = true;
      });
      Future.delayed(Duration(milliseconds: 900)).then((value) {
        Navigator.push(context, ScaleRoute(page: (RedPage())));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OverflowBox(
        maxHeight: MediaQuery.of(context).size.longestSide * 2,
        maxWidth: MediaQuery.of(context).size.longestSide * 2,
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 1000),
          width: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
          height: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
          decoration: BoxDecoration(
            color: Color(0xFFED3E53),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class RedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFFED3E53),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "TAALIB",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 4,
                      child: Image.asset('Assets/welcomePage.png'),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Hero(
                      tag: "sign_btn",
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }));
                        },
                        child: Text(
                          "Get started !",
                          style: TextStyle(color: Color(0xFFED3E53)),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: StadiumBorder(),
                            fixedSize: Size(170, 50)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: "login_btn",
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePage();
                          }));
                        },
                        child: Text(
                          "Log in ",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFED3E53),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(170, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        );
}
