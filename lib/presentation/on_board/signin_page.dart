import 'package:expanse_app/data/modal/login_modal.dart';
import 'package:expanse_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_page.dart';

class CreateAccount extends StatefulWidget {

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmpasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Text('Enter your full Name ',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Email address',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Password',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              controller:passwordController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Confirm Password',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              controller:confirmpasswordController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary
            ),
                onPressed: (){
              var password=passwordController.text.toString();
              var conpassword=confirmpasswordController.text.toString();
              if(password == conpassword){
                context.read<LoginBloc>().add(CreateAcct(creatcct:LoginModal(
                    name:nameController.text.toString(),
                    email:emailController.text.toString(),
                    password:passwordController.text.toString()
                )));
              }else{
                showAlertDialog(context);

              }

                }, child:Text("Create Account")),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an acct',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),

                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                }, child: Text('Log in ?',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),)
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("password & confirm password are not matched"),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



}
