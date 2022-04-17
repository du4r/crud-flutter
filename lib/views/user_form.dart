import 'package:flutter/material.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:crud_flutter/models/user.dart';


class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String,String> _formData = {};

  void _loadFormData(User user){
    
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;

  }

  @override
  Widget build(BuildContext context) {

    final user = ModalRoute.of(context)!.settings.arguments as User;
    
    _loadFormData(user);

    return Scaffold(
       appBar: AppBar(
         title: Text('formulario de usuarios'),
         actions: [
           IconButton(
             icon: Icon(Icons.save),
             onPressed:(){
               final isValid = _form.currentState?.validate();
               if(isValid!){
               _form.currentState?.save();

              Provider.of<Users>(context, listen: false).put(User(
                id: _formData['id'].toString(),
                name: _formData['name'].toString(),
                email: _formData['email'].toString(),
                avatarUrl: _formData['avatarUrl'].toString(),
              ));
              

               Navigator.of(context).pop();
               }

             }
           )
         ]
       ),
       body: Padding(
         padding: EdgeInsets.all(10),
         child: Form(
           key: _form,
           child: Column(
             children: [
               TextFormField(
                 initialValue:_formData['name'],
                 decoration: InputDecoration(labelText: 'Nome'),
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return "nome invalido";
                   }
                 },
                onSaved: (value) => _formData['name'] = value.toString()
               ),
               TextFormField(
                 initialValue:_formData['email'],
                 decoration: InputDecoration(labelText: 'Email'),
                 onSaved: (value) => _formData['email'] = value.toString()
               ),
               TextFormField(
                 initialValue:_formData['avatarUrl'],
                 decoration: InputDecoration(labelText: 'Url do Avatar'),
                 onSaved: (value) => _formData['avatarUrl'] = value.toString()
               ),
             ]
           )
         )
       )
    );
  }
}