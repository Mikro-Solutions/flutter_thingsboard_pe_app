import 'package:systemat_app/core/entity/entities_base.dart';
import 'package:systemat_app/core/entity/entities_list.dart';
import 'package:systemat_app/modules/audit_log/audit_logs_base.dart';
import 'package:systemat_app/thingsboard_client.dart';

class AuditLogsList extends BaseEntitiesWidget<AuditLog, TimePageLink>
    with AuditLogsBase, EntitiesListStateBase {
  AuditLogsList(
    super.tbContext,
    super.pageKeyController, {
    super.key,
    searchMode = false,
  }) : super(searchMode: searchMode);
}
