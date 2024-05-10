import 'package:expanse_app/data/modal/expanse_modal.dart';
import 'package:expanse_app/data/modal/login_modal.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../main.dart';

class ExpanseDataBase{
  ExpanseDataBase._();

  static final ExpanseDataBase dataBase=ExpanseDataBase._();

  static const String Table_Name="expanse_data";
  static const String Table_ID="id";
  static const String Table_Title="note_title";
  static const String Table_Desc="note_desc";
  static const String Table_Amount="amount";
  static const String Table_Type="type";
  static const String Table_Cate_Id="category";
  static const String Table_Time="created_at";
  //
  static const String User_Table="account_table";
  static const String User_Id="account_id";
  static const String User_Name="name";
  static const String User_Email="email_address";
  static const String User_Password="password";






  Database? myData;

  createDb() async {
    if(myData!=null){
      return myData;
    }else{
      var myData=await initDb();
      return myData;
    }
  }

  initDb() async {
    var makePath=await getApplicationDocumentsDirectory();
    var actualPath=join(makePath.path,"expanseDb.db");
    return await openDatabase(actualPath,version: 1,onCreate: (dataBase,version){
      dataBase.execute("create table $Table_Name ( $Table_ID integer primary key autoincrement, $Table_Title text, $Table_Desc text, $Table_Type text, $Table_Amount text, $Table_Cate_Id integer, $Table_Time text, $User_Id integer)");

      dataBase.execute("create table $User_Table ( $User_Id integer primary key autoincrement, $User_Name text, $User_Email text, $User_Password text)");
    });
  }



  createAcctUser({required LoginModal createAcct}) async {
    var create= await createDb();
    var checkAcct=await emailAlreadyExist(email: createAcct.email);
    bool check=false;
      if(checkAcct!=null && checkAcct) {
        var roweffect = await create.insert(User_Table, createAcct.toMap());
        check = roweffect > 0;
      //}
    }
    return check;
  }

  emailAlreadyExist({required String email}) async {
    var create= await createDb();
    var data=await create.query(User_Table,where:"$User_Email = ?",whereArgs:[email]);
    return data.isNotEmpty;

  }

  /// fetch data

fetchDataBase() async {
  var create= await createDb();
  var getid=await getUid();
  var fetch=await create.query(User_Table,where:"$User_Id =?",whereArgs:["$getid"]);
  List<LoginModal> userList=[];

  for(Map<String,dynamic> eachModal in fetch){
    var getall=LoginModal.fromMap(eachModal);
    userList.add(getall);
  }
  return userList;
}

// shared preferencs

 getUid() async {
    var perfs=await SharedPreferences.getInstance();
   return perfs.getInt("main.Uid")!;
}

 setUid(int Uid) async {
    var prefs=await SharedPreferences.getInstance();
    return prefs.setInt("main.Uid",Uid);
}
///login

 Future<bool> userLogin({required String email,required String password}) async {
    var create= await createDb();
    var check=await create.query(User_Table,where:"$User_Email=? AND $User_Password=?",whereArgs:[email,password]);
    if(check.isNotEmpty){
      await setUid(LoginModal.fromMap(check[0]).id);
    }
    return check.isNotEmpty;



  }



/// Add expanse ...

   addexpanse({required ExpanseModal addExpanse}) async {
     var create= await createDb();
     var uid=await getUid();
     addExpanse.uid=uid;
     return create.insert(Table_Name,addExpanse.toMap());


   }



}