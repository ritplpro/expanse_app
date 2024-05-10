

import '../local_repository/database.dart';



class LoginModal{
  int id;
  String name;
  String email;
  String password;

  LoginModal({this.id=0,required this.name,required this.email,required this.password});


  factory LoginModal.fromMap(Map<String,dynamic> map){
    return LoginModal(id:map[ExpanseDataBase.User_Id],
    name: map[ExpanseDataBase.User_Name],
        email:map[ExpanseDataBase.User_Email],
        password:map[ExpanseDataBase.User_Password]);
  }

  Map<String,dynamic> toMap(){
    return{
      ExpanseDataBase.User_Name:name,
      ExpanseDataBase.User_Email:email,
      ExpanseDataBase.User_Password:password
    };
  }


}