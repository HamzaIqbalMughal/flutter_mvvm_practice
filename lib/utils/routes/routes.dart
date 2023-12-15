import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_practice/view/home_screen.dart';
import 'package:flutter_mvvm_practice/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> LogInScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
