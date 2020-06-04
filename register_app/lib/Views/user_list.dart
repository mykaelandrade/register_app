import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerapp/Components/user_tile.dart';
import 'package:registerapp/Provider/users.dart';
import 'package:registerapp/Routes/app_routes.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProviders users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.USER_FORM
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
