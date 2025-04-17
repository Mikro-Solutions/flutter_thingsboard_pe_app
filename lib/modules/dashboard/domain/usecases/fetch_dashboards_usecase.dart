import 'package:systemat_app/thingsboard_client.dart';
import 'package:systemat_app/utils/usecase.dart';

class FetchDashboardsUseCase
    extends UseCase<Future<PageData<DashboardInfo>>, PageLink> {
  const FetchDashboardsUseCase(this.tbClient);

  final ThingsboardClient tbClient;

  @override
  Future<PageData<DashboardInfo>> call(PageLink params) {
    return tbClient
        .getDashboardService()
        .getUserDashboards(params, mobile: true);
  }
}
