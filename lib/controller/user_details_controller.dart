library singleapp;

import 'package:angular/angular.dart';

import '../service/user_service.dart';

@NgController(
    selector: '[user-details-controller]',
    publishAs: 'ctrl')


class UserDetailsController {

  UserService _userService;
  get selectedUser => _userService.selectedUser;

  UserDetailsController(UserService this._userService){
      print("init");
  }
}