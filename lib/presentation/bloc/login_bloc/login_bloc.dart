import 'package:bloc/bloc.dart';
import 'package:expanse_app/data/modal/login_modal.dart';
import 'package:meta/meta.dart';

import '../../../data/local_repository/database.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ExpanseDataBase dataBase;
  LoginBloc({required this.dataBase}) : super(InitialState()) {
    on<CreateAcct>((event, emit) async {
      emit(LoadingState());
      bool isadded=await dataBase.createAcctUser(createAcct: event.creatcct);
      if (isadded!=null){
        var mData=await dataBase.fetchDataBase();
        emit(LoadedState(logindata: mData));
      }else{
        emit(ErrorState(errorMsg: "acct was not created !!"));
      }
    });

    on<LoginAcct>((event, emit) async {
      emit(LoadingState());
      var isLogin=await dataBase.userLogin(email:event.uEmail, password:event.uPass);
      if(isLogin){
        var mData=await dataBase.fetchDataBase();
        emit(LoadedState(logindata: mData));
      }else{
        emit(ErrorState(errorMsg: 'invalid crediantial!!'));
      }
    });


  }
}
