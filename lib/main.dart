import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animedcontroller;
  late Animation<Offset> _animation;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animedcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _animedcontroller, curve: Curves.linear));
    _animation1 = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _animedcontroller, curve: Curves.linear));
    _animation2 = Tween<Offset>(begin: Offset(0, 2), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _animedcontroller, curve: Curves.linear));
    _animedcontroller.forward();
  }

  final bool _islogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/im_party.jpeg'),
              fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black.withOpacity(.6),
          Colors.black.withOpacity(.5),
          Colors.black.withOpacity(.4),
          Colors.black.withOpacity(.1),
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SlideTransition(
              position: _animation,
              child: Text(
                'Find the best parties near you',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SlideTransition(
              position: _animation1,
              child: Text(
                'Let us find you party for yout interest',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            _islogin
                ? SlideTransition(
                    position: _animation2,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade900,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                : SlideTransition(
                    position: _animation,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          'Google+',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}
