import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';

import '../res/components/round_botton.dart';
import '../utils/routes/routes_name.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  ValueNotifier<bool> _obsecurePass = ValueNotifier(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obsecurePass.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;

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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
                labelText: 'Email',
              ),
              onFieldSubmitted: (value){
                // FocusScope.of(context).requestFocus(passwordFocusNode); //conventional method for shifting focus // other method is using utils class
                Utils.fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePass,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: _obsecurePass.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      labelText: 'Password',
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecurePass.value = !_obsecurePass.value;
                        },
                          child: _obsecurePass.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: height * .05),
            RoundButton(title: 'Log In',
                onPress: (){
                  if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter Email and Password', context);
                  }
                  else if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter email', context);
                  }
                  else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please Enter Password', context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage('Please Enter 6 digit pass', context);
                  }else{
                    print('api hit');
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
