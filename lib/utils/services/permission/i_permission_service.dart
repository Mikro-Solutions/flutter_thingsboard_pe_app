import 'package:systemat_app/core/context/tb_context.dart';

abstract interface class IPermissionService {
  bool haveViewDashboardPermission(TbContext context);
}
