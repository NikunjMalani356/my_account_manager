import 'package:account_manager/Dashboard.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()
  async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Main(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("account manager")
        //Image(image: AssetImage('iplimages/Indian_Premier_League_logo.png'),fit : BoxFit.cover),
      ),
    );
  }
}
