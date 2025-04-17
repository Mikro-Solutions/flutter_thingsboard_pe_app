import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:systemat_app/config/routes/router.dart';
import 'package:systemat_app/core/init/inti_region_app.dart';

import 'init_app.dart';

class InitRoutes extends TbRoutes {
  InitRoutes(super.tbContext);

  late final initHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitApp(tbContext);
    },
  );

  late final regionSelectedHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitRegionApp(tbContext);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define('/', handler: initHandler);
  }
}
