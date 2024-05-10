part of 'login_bloc.dart';

abstract class LoginEvent {}

class CreateAcct extends LoginEvent{
  LoginModal creatcct;
  CreateAcct({required this.creatcct});
}

class LoginAcct extends LoginEvent{
  String uEmail;
  String uPass;
  LoginAcct({required this.uEmail,required this.uPass});
}
