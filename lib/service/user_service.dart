library singleapp_user_service;

import 'dart:async';

import 'user.dart';
import 'package:angular/angular.dart';

class UserService {
  String _usersUrl = 'userdata.json';

  Future _loaded;

  User _selectedUser;

  Map<String, User> _usersCache;

  Http _http;

  UserService(Http this._http) {
    _loaded = Future.wait([_loadUsers()]);
  }

  Future _loadUsers() {
    return _http.get(_usersUrl)
      .then((HttpResponse response) {
        _usersCache = new Map();
        for (Map user in response.data) {
          User u = new User.fromJsonMap(user);
          _usersCache[u.id] = u;
        }
      });
  }


  Future<User> getUserById(String id) {
    if (_usersCache == null) {
      return _loaded.then((_) {
        return _usersCache[id];
      });
    }
    return new Future.value(_usersCache[id]);
  }

  Future<Map<String, User>> getAllUsers() {
    if (_usersCache == null) {
      return _loaded.then((_) {
        return _usersCache;
      });
    }
    return new Future.value(_usersCache);
  }

  set selectUser(User user) {
    this._selectedUser = user;
  }

  get selectedUser => this._selectedUser;


}
