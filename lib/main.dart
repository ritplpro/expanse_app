import 'package:expanse_app/data/local_repository/database.dart';
import 'package:expanse_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:expanse_app/presentation/on_board/login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create:(context)=>LoginBloc(dataBase: ExpanseDataBase.dataBase)),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LoginPage(),
    );
  }
}