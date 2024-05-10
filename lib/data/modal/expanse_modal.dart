import 'package:expanse_app/data/local_repository/database.dart';

class ExpanseModal{
  int id;
  String title;
  String desc;
  String amount;
  String type;
  String category;
  String time;
  String uid;

  ExpanseModal({this.id=0,required this.title,required this.desc,required this.amount,required this.category,required this.type,required this.uid,required this.time});



  factory ExpanseModal.fromMap(Map<String,dynamic> map){
    return ExpanseModal(id:map[ExpanseDataBase.Table_ID],
        title:map[ExpanseDataBase.Table_Title],
        desc:map[ExpanseDataBase.Table_Desc],
        amount:map[ExpanseDataBase.Table_Amount],
        category:map[ExpanseDataBase.Table_Cate_Id],
        type: map[ExpanseDataBase.Table_Type],
        uid: map[ExpanseDataBase.User_Id],
        time:map[ExpanseDataBase.Table_Time]);
  }


  Map<String,dynamic> toMap(){
    return {
  ExpanseDataBase.Table_Title:title,
  ExpanseDataBase.Table_Desc:desc,
  ExpanseDataBase.Table_Amount:amount,
  ExpanseDataBase.Table_Type:type,
  ExpanseDataBase.Table_Cate_Id:category,
  ExpanseDataBase.Table_Time:time,
  ExpanseDataBase.User_Id:uid
    };
  }


}