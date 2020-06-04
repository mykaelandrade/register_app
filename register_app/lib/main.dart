import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerapp/Provider/users.dart';
import 'package:registerapp/Routes/app_routes.dart';
import 'package:registerapp/Views/user_form.dart';
import 'package:registerapp/Views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UsersProviders(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserList(),
        routes: {
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
