import 'package:flutter/material.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              // Utils.flushBarErrorMessage('No Internet Connection', context);
              Utils.snakeBar('No Internet', context);
              // Utils.toastMessage('Hello...');
              // Navigator.pushNamed(context, 'hello');
            },
            child: Text('Click here'),
          )
        ],
      ),
    );
  }
}
