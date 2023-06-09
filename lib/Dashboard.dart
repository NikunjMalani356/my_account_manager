import 'package:account_manager/Entry_page.dart';
import 'package:account_manager/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController name = TextEditingController();
  Mycontroller m = Get.put(Mycontroller());

  double pad = 7;
  bool t = false;
  List a = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.userget();
    // m.credittotal();
    // m.dedittotal();
    print(m.l);
    print("lengnth = ${m.l.length}");
    get();
  }

  get() async {
    m.main_cre_total_fun();
    m.main_de_total_fun();
    m.getaccbyid();

    t = true;
  }

  Widget build(BuildContext context) {
    print("cre total list = ${m.maincretotal}");
    print("de total list = ${m.maincretotal}");

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("name"),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.all(pad),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Credit()"),
                        Obx(() => Text("${m.grand_credit}"))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.all(pad),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("debit()"),
                        Obx(() => Text("${m.grand_debit}"))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.all(pad),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlueAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("balance"),
                        Obx(() => Text("${m.grand_total}"))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Card(
                child: ListTile(
                  leading: CircleAvatar(
                   // backgroundImage: FileImage(File("")),
                  ),
                )),
            ListTile(
              title: Text("Home"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Backup"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Restore"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Change Privacy"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Change Password"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Change Security Question"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Setting"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Share the app"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Rate the app"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("More App"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Ads free"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),


            ElevatedButton(onPressed: () {}, child: Text("Exit"))
          ],
        ),
      ),
      body: (t)
          ?Obx(() =>  ListView.builder(
            itemCount: m.l.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  m.entryget();
                  m.curuntind(m.l[index]['id'],index);

                  Get.to(Entry_page());
                },
                child: Obx(() => Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              "${m.l[index]['name']}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(onTap: () {

                                },
                                  child: Container(
                                      margin: EdgeInsets.all(4),
                                      child: Icon(Icons.add)),
                                ),
                                InkWell(
                                    onTap: () {
                                      m.delete_user(m.l[index]['id']);
                                      m.userget();
                                      m.getaccbyid();
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(4),
                                        child: Icon(Icons.delete))),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.all(pad),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Credit()"),
                                  Obx(() => Text("${m.creditlist[index]}"))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.all(pad),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("debit()"),
                                  Obx(() => Text("${m.debitlist[index]}"))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.all(pad),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlueAccent),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("balance"),
                                  Obx(() => Text("${m.totallist[index]}"))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              );
            },
          ))
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return  AlertDialog(actions: [
                Form(
                    child: Container(
                      child: Column(
                        children: [
                          Text("Add New Account"),
                          TextField(controller: name),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    String nm = name.text;
                                    m.username(nm);
                                    m.getaccbyid();
                                    m.userget();
                                    m.getaccbyid();
                                    m.userget();
                                    // m.dedittotal();
                                    // m.credittotal();
                                    m.userget();

                                    print(m.cretotal[0]['ctotal']);
                                    print("lllll = ${m.l}");
                                    name.clear();

                                    Navigator.pop(context);
                                  },
                                  child: Text("Save")),
                            ],
                          )
                        ],
                      ),
                    ))
              ]);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
