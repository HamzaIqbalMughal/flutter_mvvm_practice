import 'package:flutter/material.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_botton.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

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

    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
            RoundButton(title: 'Sign Up',
                loading: authViewModel.signUpLoading,
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
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.signUpApi(data, context);
                  }
                }
            ),
            SizedBox(height: height * 0.02,),
            InkWell(
              onTap: (){
                // Navigator.pushNamed(context, RoutesName.login);
                Navigator.pop(context);
              },
              child: Text("Already have an Account? LogIn"),
            ),

          ],
        ),
      ),
    );
  }

}
