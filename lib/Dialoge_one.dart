
import 'package:account_manager/Dialoge_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void  main()
{
  runApp(GetMaterialApp(home: Dialoge_one(),));
}
class Dialoge_one extends StatefulWidget {
  const Dialoge_one({Key? key}) : super(key: key);

  @override
  State<Dialoge_one> createState() => _Dialoge_oneState();
}

class _Dialoge_oneState extends State<Dialoge_one> {
    TextEditingController pass = TextEditingController();
    TextEditingController q1= TextEditingController();
    TextEditingController q2 = TextEditingController();


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // showAlert(context);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(decoration: BoxDecoration(color: Colors.white),
        child: Container(decoration: BoxDecoration(
          border: Border.all(color: Colors.black12,width: 2)
        ),margin: EdgeInsets.only(right: 30,left: 30,bottom: 150,top: 150),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent
                  ),
                  child: Text("Setting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                TextField(controller: pass,autofocus: true
                    ,decoration: InputDecoration(hintText: "Set password",contentPadding: EdgeInsets.symmetric(horizontal: 20))),
                InkWell(onTap: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      actions: [
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),

                      ],
                    );
                  },);
                },
                  child: Container(alignment: Alignment.center,
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12,width: 1)
                    ),
                    child: Text("Security Question 1         >"),
                  ),
                ),
                TextField(controller: q1,decoration: InputDecoration(hintText: "Answer",contentPadding: EdgeInsets.symmetric(horizontal: 20))),
                InkWell(onTap: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      actions: [
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),
                        ListTile(onTap: () {
                        },title: Text("123"),),

                      ],
                    );
                  },);
                },
                  child: Container(alignment: Alignment.center,
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,width: 1)
                    ),
                    child: Text("Security Question 1         >"),
                  ),
                ),
                TextField(controller: q2,decoration: InputDecoration(hintText: "Answer",contentPadding: EdgeInsets.symmetric(horizontal: 20))),


                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: () {
                     Navigator.pop(context);
                    }, child: Text("Exit")),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Dialoge_two();
                      },));
                    }, child: Text("Set")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
