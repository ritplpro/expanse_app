part of 'login_bloc.dart';


abstract class LoginState {}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class LoadedState extends LoginState {
  List<LoginModal> logindata=[];
  LoadedState({required this.logindata});
}
class ErrorState extends LoginState {
  String errorMsg;
  ErrorState({required this.errorMsg});
}
