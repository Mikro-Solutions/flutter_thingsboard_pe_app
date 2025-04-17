import 'package:flutter/material.dart';
import 'package:systemat_app/core/context/tb_context_widget.dart';
import 'package:systemat_app/locator.dart';
import 'package:systemat_app/modules/dashboard/presentation/view/dashboard_permission_error_view.dart';
import 'package:systemat_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:systemat_app/modules/dashboard/presentation/view/home_dashboard_page.dart';
import 'package:systemat_app/modules/tenant/tenants_widget.dart';
import 'package:systemat_app/thingsboard_client.dart';
import 'package:systemat_app/utils/services/permission/i_permission_service.dart';

class HomePage extends TbContextWidget {
  HomePage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends TbContextState<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeDashboard = tbContext.homeDashboard;
    if (homeDashboard != null) {
      return _buildDashboardHome(context, homeDashboard);
    } else {
      return _buildDefaultHome(context);
    }
  }

  Widget _buildDashboardHome(
    BuildContext context,
    HomeDashboardInfo dashboard,
  ) {
    final hasPermission =
        getIt<IPermissionService>().haveViewDashboardPermission(
      tbContext,
    );

    if (hasPermission) {
      return HomeDashboardPage(tbContext, dashboard);
    } else {
      return DashboardPermissionErrorView(
        tbContext,
        fullScreen: true,
        home: true,
      );
    }
  }

  Widget _buildDefaultHome(BuildContext context) {
    if (tbClient.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else {
      final hasPermission =
          getIt<IPermissionService>().haveViewDashboardPermission(
        tbContext,
      );

      if (hasPermission) {
        return DashboardsPage(tbContext);
      } else {
        return DashboardPermissionErrorView(
          tbContext,
          fullScreen: true,
          home: true,
        );
      }
    }
  }

  Widget _buildSysAdminHome(BuildContext context) {
    return TenantsWidget(tbContext);
  }
}
