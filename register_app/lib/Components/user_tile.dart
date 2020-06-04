import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerapp/Models/user.dart';
import 'package:registerapp/Provider/users.dart';
import 'package:registerapp/Routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Excluir Usuário'),
                          content: Text('Deseja Realmente Excluir?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Não'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Provider.of<UsersProviders>(context,
                                        listen: false)
                                    .remove(user);
                                Navigator.of(context).pop();
                              },
                              child: Text('Sim'),
                            ),
                          ],
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
