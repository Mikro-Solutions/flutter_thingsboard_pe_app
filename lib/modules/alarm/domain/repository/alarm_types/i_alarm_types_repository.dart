import 'package:systemat_app/thingsboard_client.dart';

abstract interface class IAlarmTypesRepository {
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey);
}
