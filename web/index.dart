library singleapp;

import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:di/di.dart';
import 'package:logging/logging.dart';
import 'package:perf_api/perf_api.dart';
import 'package:di/di.dart';


import '../lib/service/user.dart';
import '../lib/service/user_service.dart';
import '../lib/controller/user_list_controller.dart';
import '../lib/controller/user_details_controller.dart';
import '../lib/routing/singleapp_router.dart';


class SingleAppModuleAngular extends Module{

  SingleAppModuleAngular() {
    type(UserListController);
    type(UserDetailsController);
    type(UserService);
    type(RouteInitializer, implementedBy: SingleappRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}


main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  ngBootstrap(module: new SingleAppModuleAngular());

}
