import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'mycontroller.dart';

class Entry_page extends StatefulWidget {
  //int useruind = 0;
  Entry_page();

  @override
  State<Entry_page> createState() => _Entry_pageState();
}

class _Entry_pageState extends State<Entry_page> {
  TextEditingController amt = TextEditingController();
  TextEditingController prt = TextEditingController();
  Mycontroller m = Get.put(Mycontroller());
  String dateStr = "";
  double pad = 10;
  bool t = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  get();
  }
  get()
  {
    m.entryget();
    m.detotal();
    // m.credittotal();
    // m.dedittotal();
    //
    DateTime today = DateTime.now();
    dateStr = "${today.day}/${today.month}/${today.year}";
    t = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
        actions: [
          InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(color: Colors.deepPurpleAccent),
                              child: Text("Transaction",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              height: 10,
                              //  child: SfDateRangePicker(),
                            ),
                            Text("date =$dateStr"),
                            Obx(
                              () => RadioListTile(
                                title: Text("credit"),
                                value: "credit",
                                groupValue: m.selectedgender.value,
                                onChanged: (value) {
                                  m.onchangegender(value);
                                  print(m.selectedgender.value);
                                },
                              ),
                            ),
                            Obx(
                              () => RadioListTile(
                                title: Text("debit"),
                                value: "debit",
                                groupValue: m.selectedgender.value,
                                onChanged: (value) {
                                  m.onchangegender(value);
                                },
                              ),
                            ),
                            TextField(
                                controller: amt,
                                decoration: InputDecoration(
                                    hintText: "Ammount",
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20))),
                            TextField(
                                controller: prt,
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintText: "Particular",
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20))),
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
                                      print("entry");
                                      String amtt = amt.text.toString();
                                      String prtt = prt.text;
                                      String date = dateStr.toString();
                                      print(m.selectedgender.value);

                                      if (m.selectedgender.value == "credit") {
                                        m.creditentry(date,m.selectedgender.value, amtt, prtt);
                                      } else if (m.selectedgender.value == "debit"){
                                        m.debitentry(date,
                                            m.selectedgender.value, amtt, prtt);
                                      }
                                      m.entryget();
                                      // m.credittotal();
                                      // m.dedittotal();
                                      m.dtotal();
                                      m.getaccbyid();

                                      print("entry :${m.entrylist}");
                                      print("credit entry = ${m.ctotal.value}");
                                      print(m.cretotal.value);

                                      Navigator.pop(context);
                                    },
                                    child: Text("Add")),
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add))
        ],
      ),
      body:(t)?Obx(() =>
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("id"),
                          Text("userind"),
                          Text("date"),
                          Text("Particular"),
                          Text("Credit()"),
                          Text("Debit()"),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: m.entrylist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        actions: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                height: 70,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .deepPurpleAccent),
                                                                child: Text(
                                                                    "Transaction",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                              Container(
                                                                height: 10,
                                                                //  child: SfDateRangePicker(),
                                                              ),
                                                              Text(
                                                                  "date =$dateStr"),
                                                              Obx(
                                                                () =>
                                                                    RadioListTile(
                                                                  title: Text(
                                                                      "credit"),
                                                                  value:
                                                                      "credit",
                                                                  groupValue: m
                                                                      .selectedgender
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    m.onchangegender(
                                                                        value);
                                                                    print(m
                                                                        .selectedgender
                                                                        .value);
                                                                  },
                                                                ),
                                                              ),
                                                              Obx(
                                                                () =>
                                                                    RadioListTile(
                                                                  title: Text(
                                                                      "debit"),
                                                                  value:
                                                                      "debit",
                                                                  groupValue: m
                                                                      .selectedgender
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    m.onchangegender(
                                                                        value);
                                                                  },
                                                                ),
                                                              ),
                                                              TextField(
                                                                  controller:
                                                                      amt,
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          "Ammount",
                                                                      contentPadding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 20))),
                                                              TextField(
                                                                  controller:
                                                                      prt,
                                                                  autofocus:
                                                                      true,
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          "Particular",
                                                                      contentPadding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 20))),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          "Cancel")),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            "entry");
                                                                        String
                                                                            amtt =
                                                                            amt.text.toString();
                                                                        String
                                                                            prtt =
                                                                            prt.text;
                                                                        String
                                                                            date =
                                                                            dateStr.toString();
                                                                        print(m
                                                                            .selectedgender
                                                                            .value);

                                                                        if (m.selectedgender.value ==
                                                                            "credit") {
                                                                          m.updatecreditentry(
                                                                              m.entrylist[index]['id'],
                                                                              date,
                                                                              m.selectedgender.value,
                                                                              amtt,
                                                                              prtt);
                                                                        } else if (m.selectedgender.value ==
                                                                            "debit") {
                                                                          m.updatedebitentry(
                                                                              m.entrylist[index]['id'],
                                                                              date,
                                                                              m.selectedgender.value,
                                                                              amtt,
                                                                              prtt);
                                                                        }
                                                                        m.entryget();
                                                                        // m.credittotal();
                                                                        // m.dedittotal();
                                                                        m.dtotal();
                                                                        m.getaccbyid();
                                                                        print(
                                                                            "entry :${m.entrylist}");
                                                                        print(
                                                                            "credit entry = ${m.ctotal.value}");
                                                                        print(m
                                                                            .cretotal
                                                                            .value);

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          "Add")),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text("edit")),
                                            TextButton(
                                                onPressed: () {
                                                  m.deleteentry(
                                                      m.entrylist[index]['id']);
                                                  m.entrylist();
                                                  // m.credittotal();
                                                  // m.dedittotal();
                                                  m.getaccbyid();

                                                  Navigator.pop(context);
                                                },
                                                child: Text("Delete")),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${m.entrylist[index]['id']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                    Text("${m.entrylist[index]['userind']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                    Text("${m.entrylist[index]['date']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                    Text("${m.entrylist[index]['part']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                    Text("${m.entrylist[index]['camt']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                    Text("${m.entrylist[index]['damt']}",style: TextStyle(color: (m.entrylist[index]['camt']=="0")?Colors.red:Colors.blue)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,margin: EdgeInsets.all(pad),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                              child: Column(mainAxisAlignment:  MainAxisAlignment.center,
                                children: [
                                  Text("Credit()"),
                                  Text("${m.creditlist[m.index.value]}")
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(height: 60,margin: EdgeInsets.all(pad),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("debit()"),
                                  Text("${m.debitlist[m.index.value]}")
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(height: 60,margin: EdgeInsets.all(pad),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlueAccent),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("balance"),
                                  Text("${m.totallist[m.index.value]}")
                                ],
                              ),
                            ),
                          )
                        ],

                      )
                    ],
                  ),
                ),
              ),
            ],
          )):CircularProgressIndicator(),
    );
  }
}
