import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'main.dart';
import 'package:path/path.dart';

class Mycontroller extends GetxController
{
  //RxString user="".obs;
  RxList l = [].obs;
  RxList entrylist = [].obs;

  RxString side = "".obs;
  var selectedgender = "".obs;
  String credit = "";
  String debit = "";
  RxInt entid = 0.obs;
  RxInt index= 0.obs;

  RxList ctotal = [].obs;
  RxList dtotal = [].obs;

  RxList cretotal =[].obs;
  RxList detotal =[].obs;
  RxInt balance = 0.obs;
  RxBool temp =false.obs;
  RxList ids = [].obs;
  RxList maincretotal = [].obs;
  RxList maindetotal = [].obs;
  RxList templist=[].obs;
  RxInt credit1=0.obs;
  RxInt debit1=0.obs;
  RxInt total1=0.obs;
  RxList creditlist=[].obs;
  RxList debitlist=[].obs;
  RxList totallist=[].obs;

  RxInt grand_credit=0.obs;
  RxInt grand_debit=0.obs;
  RxInt grand_total=0.obs;

  RxBool dashtemp = false.obs;




  onchangegender(var gender)
  {
    selectedgender.value = gender;
  }


  Future<Database> get_database()
  async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)');
          await db.execute(
              'CREATE TABLE entry1 (id INTEGER PRIMARY KEY AUTOINCREMENT,userind TEXT,date TEXT,part TEXT,key TEXT,camt TEXT,damt TEXT)');
        });
    return database;
  }
  username(String a)
  async {

    String qry ="insert into user values(null,'$a')";
    Main.database!.rawInsert(qry);

  }

  Future userget()async
  {
    get_database().then((value) async {
      String sql="select * from user";
          value.rawQuery(sql).then((value){
            l.value=value;

          });
    });

  }
  curuntind(int ind,int inde)
  {
    entid.value = ind;
    index.value = inde;

  }

  main_cre_total_fun()
  {
    get_database().then((value) async {

        String sql3="select sum(camt) as ctotal from entry1 where userind='${ids[0]}'";
        value.rawQuery(sql3).then((value){
          maincretotal.value=value;
          maincretotal.forEach((element) {
          });

          print("value= ${value}");
        });
           });
    print("main cre total list = ${maincretotal.value}");

  }

  main_de_total_fun()
  {
    get_database().then((value) async {
      for(int i = 0;i<l.value.length;i++)
      {
        String sql3="select sum(damt) as dtotal from entry1 where userind='${ids[i]}'";
        value.rawQuery(sql3).then((value){
          maindetotal.value.add(value);
          print("value= ${value}");
        });
      }
    });
    print("main de total list = ${maindetotal.value}");

  }


  creditentry(date,side,amt,prt)
  {
    String qry ="insert into entry1 values(null,'${entid}','$date','$prt','$side','$amt','0')";
    Main.database!.rawInsert(qry);
  }

  debitentry(date,side,amt,prt)
  {
    String qry ="insert into entry1 values(null,'${entid}','$date','$prt','$side','0','$amt')";
    Main.database!.rawInsert(qry);

  }

   entryget()async
  {
    get_database().then((value) async {
      String sql1="select * from entry1 where userind='${entid.toString()}' ";
      //   Main.database!.rawQuery(sql);
      value.rawQuery(sql1).then((value){
        entrylist.value=value;
      });
    });


  }




   getaccbyid() {
    userget();
     credit1.value=0;
     debit1.value=0;
     total1.value=0;
     ids = [].obs;
     grand_credit=0.obs;
     grand_debit=0.obs;
     grand_total=0.obs;

    l.forEach((element) {
       ids.value.add(element['id']);
     });
    creditlist.value= List.generate(ids.length+1, (index) => 0) ;
    debitlist.value =List.generate(ids.length+1, (index) => 0) ;
    totallist.value=List.generate(ids.length+1, (index) => 0) ;

    print("l length  ${l.length}");
    print("ids list = ${ids.value}");
    for(int j=0;  j<l.value.length;  j++)
      {
        get_database().then((value) {
          String q="select * from user join entry1 on user.id=entry1.userind where user.id=${ids.value[j]}";
          value.rawQuery(q).then((value){
            credit1.value=0;
            debit1.value=0;
            total1.value=0;
            templist.value=value;

            print("new value = ${value}");
            templist.forEach((element)
            {
              if(element['key']=="credit")
              {
                print("succcess");

                credit1.value=credit1.value+ int.parse(element['camt']);
              }
              if(element['key']=="debit")
              {
                print("succcess1");
                debit1.value=debit1.value+int.parse(element['damt']);
              }
            });
            total1.value = credit1.value - debit1.value;
            creditlist[j] = credit1.value;
            debitlist[j] = debit1.value;
            totallist[j] = total1.value;
            grand_total_fun();
            print("credit list  ${creditlist}");
            print("debit list  ${debitlist}");
            print("total list  ${totallist}");


          });
        });
      }
  }

  grand_total_fun()
  {
    grand_credit=0.obs;
    grand_debit=0.obs;
    grand_total=0.obs;

    print("credit list  ${creditlist}");
    print("debit list  ${debitlist}");
    print("total list  ${totallist}");

    creditlist.forEach((element) {
      print("cre element =$element");
      grand_credit = grand_credit+element;

    });

    debitlist.forEach((element) {
      print("de element =$element");
      grand_debit = grand_debit+element;

    });

    totallist.forEach((element) {
      print(" to element =$element");
      grand_total = grand_total+element;

    });
  }


  // credittotal()
  // {
  //   get_database().then((value) async {
  //     String sql3="select sum(camt) as ctotal from entry1 where userind='${entid}'";
  //     value.rawQuery(sql3).then((value){
  //       cretotal.value =  value;
  //       print(value);
  //       balance.value = cretotal.value[0]['ctotal'] - detotal.value[0]['dtotal'] ;
  //     });
  //   });
  // }
  //
  // dedittotal()
  // {
  //   get_database().then((value) async {
  //     String sql4="select sum(damt) as dtotal from entry1 where userind='${entid}'";
  //     value.rawQuery(sql4).then((value){
  //       detotal.value = value;
  //       print(value);
  //       balance.value = cretotal.value[0]['ctotal'] - detotal.value[0]['dtotal'] ;
  //     });
  //   });
  //   print(dtotal.value);
  //
  // }
  //


  deleteentry(index)
  {
    String qry3 ="delete from entry1 where id ='${index}'";
    Main.database!.rawInsert(qry3);

    String qry6 ="delete from user where userind ='${index}'";
    Main.database!.rawInsert(qry6);
    print(index);

    entryget();

  }

  updatecreditentry(id,date,side,amt,prt)
  {

    String qry ="UPDATE entry1 SET date = '${date}',part = '${prt}',camt = '${amt}',damt = '${0}' WHERE id='${id}'";
    Main.database!.rawInsert(qry);
    entryget();

  }

  updatedebitentry(id,date,side,amt,prt)
  {
    String qry ="UPDATE entry1 SET date = '${date}',part = '${prt}',camt = '${0}',damt = '${amt}' WHERE id='${id}'";
    Main.database!.rawInsert(qry);
    entryget();

  }


  delete_user(index)
  {
    String qry3 ="delete from user where id='${index}'";
    Main.database!.rawInsert(qry3);
    print(index);
    userget();

  }
}