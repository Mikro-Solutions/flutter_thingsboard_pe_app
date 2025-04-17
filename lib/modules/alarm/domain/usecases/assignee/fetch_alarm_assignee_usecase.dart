import 'package:systemat_app/core/usecases/user_details_usecase.dart';
import 'package:systemat_app/locator.dart';
import 'package:systemat_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:systemat_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:systemat_app/thingsboard_client.dart';
import 'package:systemat_app/utils/usecase.dart';

class FetchAlarmAssigneeUseCase
    extends UseCase<Future<PageData<AssigneeEntity>>, UsersAssignQuery> {
  const FetchAlarmAssigneeUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<PageData<AssigneeEntity>> call(UsersAssignQuery params) async {
    final pageData = await repository.fetchAssignee(params);

    return PageData(
      pageData.data
          .map(
            (info) => AssigneeEntity.fromUserInfo(
              info,
              detailsUseCase: getIt<UserDetailsUseCase>(),
            ),
          )
          .toList(),
      pageData.totalPages,
      pageData.totalElements,
      pageData.hasNext,
    );
  }
}
