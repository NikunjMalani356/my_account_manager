import 'package:account_manager/Dashboard.dart';
import 'package:account_manager/Dialoge_one.dart';
import 'package:account_manager/Dialoge_two.dart';
import 'package:account_manager/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sqflite/sqflite.dart';
import 'mycontroller.dart';
import 'package:path/path.dart';

void main() {
  runApp(GetMaterialApp(home: splash(),));
}

class Main extends StatefulWidget {
  static Database? database;


  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Mycontroller m=Get.put(Mycontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    create_db();
    m.userget();


  }
  create_db()
  async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Main.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)');
          await db.execute(
              'CREATE TABLE entry1 (id INTEGER PRIMARY KEY AUTOINCREMENT,userind TEXT,date TEXT,part TEXT,key TEXT,camt TEXT,damt TEXT)');
        });

  }

  _navigatetohome(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Dashboard(),));
  }
  Widget build(BuildContext context) {
    _navigatetohome(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.yellow
        ),
        width:double.infinity,
        height: 100,

      ),
    );
  }
}



