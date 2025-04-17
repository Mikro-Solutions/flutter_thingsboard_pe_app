import 'package:systemat_app/modules/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:systemat_app/thingsboard_client.dart';
import 'package:systemat_app/utils/services/pagination_repository.dart';

final class AlarmsPaginationRepository
    extends PaginationRepository<AlarmQueryV2, AlarmInfo> {
  AlarmsPaginationRepository({
    required AlarmQueryController queryController,
    required this.onFetchData,
  }) : super(pageKeyController: queryController);

  final Future<PageData<AlarmInfo>> Function(AlarmQueryV2 query) onFetchData;

  @override
  Future<PageData<AlarmInfo>> fetchPageData(AlarmQueryV2 pageKey) {
    return onFetchData(pageKey);
  }
}
