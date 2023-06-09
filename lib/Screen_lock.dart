import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class Screen_lock extends StatefulWidget {
  const Screen_lock({Key? key}) : super(key: key);

  @override
  State<Screen_lock> createState() => _Screen_lockState();
}

class _Screen_lockState extends State<Screen_lock> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      this.get();
    });

  }
  get()
  {
    screenLock(
      context: context,
      correctString: '1234',
      canCancel: false,
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.red),
      ),
    );
  }
}
