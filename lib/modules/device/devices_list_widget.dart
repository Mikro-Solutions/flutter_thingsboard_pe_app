import 'package:systemat_app/core/entity/entities_base.dart';
import 'package:systemat_app/core/entity/entities_list_widget.dart';
import 'package:systemat_app/modules/device/devices_base.dart';
import 'package:systemat_app/thingsboard_client.dart';

class DevicesListWidget extends EntitiesListWidget<EntityData, EntityDataQuery>
    with DevicesBase {
  DevicesListWidget(
    super.tbContext, {
    super.key,
    super.controller,
  });

  @override
  void onViewAll() {
    navigateTo('/devices');
  }

  @override
  PageKeyController<EntityDataQuery> createPageKeyController() =>
      DeviceQueryController(pageSize: 5);
}
