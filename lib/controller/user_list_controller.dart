library singleapp;

import 'package:angular/angular.dart';

import '../service/user_service.dart';

@NgController(
    selector: '[user-list-controller]',
    publishAs: 'ctrl',
    map: const {
        'type':'=>type'
    })
class UserListController {

  static const String LOADING_MESSAGE = "Loading userdata.json";
  static const String ERROR_MESSAGE = "Loading error for userdata.json";

  String type;

  Http _http;
  UserService _userService;
  UserService get userService => _userService;

  String message = LOADING_MESSAGE;
  bool usersLoaded = false;

  Map<String, User> _userMap = {};
  get userMap => _userMap;
  get allUsers => _userMap.values.toList();
  get selectedUser => _userService.selectedUser;

  set selectUser(User user){
    _userService.selectUser=user;
  }


  UserListController(Http this._http, UserService this._userService) {
    _loadData();
  }

  void _loadData() {
    _userService.getAllUsers()
      .then((Map<String, User> allUsers) {
        _userMap = allUsers;
        usersLoaded = true;
      },
      onError: (Object obj) {
        usersLoaded = false;
        message = ERROR_MESSAGE;
      });

  }
}