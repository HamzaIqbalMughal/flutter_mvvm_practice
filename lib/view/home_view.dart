import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_practice/model/user_model.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_practice/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {

  // const HomeView({super.key});

  dynamic user;

  HomeView({super.key, this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  // late final userPreference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(kDebugMode){
      print(widget.user.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>(context);

    if(widget.user != null){
      userPreference.saveUser(widget.user).then((value) {
        if(value){
          if(kDebugMode){
            print("User's Sessions is saved Successfullly");
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    // UserModel user = UserModel();
    //
    // user.toJson();
    //
    // userPreference.saveUser()

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                userPreference.remove().then((value) {
                  // Navigator.pushNamed(context, RoutesName.login);
                  Navigator.pushReplacementNamed(context, RoutesName.login);

                });
              },
              child: Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}
