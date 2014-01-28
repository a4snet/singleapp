library singleapp_router;

import 'package:angular/angular.dart';

class SingleappRouteInitializer implements RouteInitializer {

  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
        defaultRoute: true,
        name: 'root',
        enter: view('view/root.html'))
      ..addRoute(
        name: 'semantic_test',
        path: '/semantic_test',
        enter: view('view/semantic_test.html'))
      ..addRoute(
        name: 'user',
        path: '/user',
        mount: (Route route) => route
          ..addRoute(
            name: 'list',
            path: '/list',
            enter: view('view/user/list.html'))
          ..addRoute(
            name: 'details',
            path: '/details/:userId',
            enter: view('view/user/details.html')));
  }
}
