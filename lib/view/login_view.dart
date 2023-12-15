import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
                labelText: 'Email',
              ),
              onFieldSubmitted: (value){
                // FocusScope.of(context).requestFocus(passwordFocusNode); //conventional method for shifting focus // other method is using utils class
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            TextFormField(
              focusNode: passwordFocusNode,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_open_rounded),
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
