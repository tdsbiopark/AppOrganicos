import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/provider/users.dart';

class UserTile extends StatelessWidget{

  final User user;

  const UserTile(this.user);

  get ctx => null;

  @override
  Widget build(BuildContext context){
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing:Container(
        width: 100,
        child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed:() {
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
                  content: Text('Tem certeza??'),
                  actions: <Widget>[
                    FlatButtom(
                      child: Text('Não'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButtom(
                      child: Text('Sim'),
                      onPressed: () {
                       // Provider.of<Users>(context, listen: false)
                       // .remove(user);
                        Navigator.of(context).pop();
                      },
                    )
                  ]
                )
              );           
            },
           ),
         ]
       ),
     ),
    );
  }

  FlatButtom({Null Function() onPressed, Text child}) {}
}

class Provider {
  static Users of(BuildContext context, {bool listen}) {}
}