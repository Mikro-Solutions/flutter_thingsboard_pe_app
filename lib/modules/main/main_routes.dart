import 'package:fluro/fluro.dart';
import 'package:systemat_app/config/routes/router.dart';
import 'package:systemat_app/modules/main/main_page.dart';

class MainRoutes extends TbRoutes {
  MainRoutes(super.tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define(
      '/main',
      handler: Handler(
        handlerFunc: (context, params) {
          return MainPage(tbContext);
        },
      ),
    );
  }
}
