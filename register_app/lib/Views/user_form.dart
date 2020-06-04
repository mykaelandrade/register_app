import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerapp/Models/user.dart';
import 'package:registerapp/Provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome Muito Pequeno! Mínimo de 3 Letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'E-mail Inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'E-mail Incorreto!';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _form.currentState.validate();

          if (isValid) {
            _form.currentState.save();
            Provider.of<UsersProviders>(context, listen: false).put(
              User(
                id: _formData['id'],
                name: _formData['name'],
                email: _formData['email'],
                avatarUrl: _formData['avatarUrl'],
              ),
            );
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
