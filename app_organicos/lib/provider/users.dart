import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier{
  Map<String, User> _items = {...DUMMY_USERS} as Map<String, User>;

  List<User> get all{
    return[..._items.values];
  }

  int get count{
    return _items.length;
  }

  get length => null;

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if(user == null) {
      return;
    }

    if(user.id !=null &&
     user.id.trim().isNotEmpty &&
     _items.containsKey(user.id)){
      _items.update(user.id, (_) => User(
        id: user.id,
        name: user.id,
        email: user.id,
        avatarUrl: user.id,
      ));
     } else{
    final id = Random().nextDouble().toString();
    _items.putIfAbsent('1000', () => User(
      id: '1000',
      name: 'Teste',
      email: 'teste@teste.com',
      avatarUrl: '',
    ),
   );
  }
   notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}