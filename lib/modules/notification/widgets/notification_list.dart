import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:systemat_app/core/context/tb_context.dart';
import 'package:systemat_app/modules/notification/widgets/no_notifications_found_widget.dart';
import 'package:systemat_app/modules/notification/widgets/notification_slidable_widget.dart';
import 'package:systemat_app/modules/notification/widgets/notification_widget.dart';
import 'package:systemat_app/thingsboard_client.dart';
import 'package:systemat_app/widgets/tb_progress_indicator.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    required this.pagingController,
    required this.thingsboardClient,
    required this.onClearNotification,
    required this.onReadNotification,
    required this.tbContext,
    super.key,
  });

  final ThingsboardClient thingsboardClient;
  final Function(String id, bool read) onClearNotification;
  final ValueChanged<String> onReadNotification;
  final TbContext tbContext;
  final PagingController<PushNotificationQuery, PushNotification>
      pagingController;

  @override
  Widget build(BuildContext context) {
    return PagingListener(
      controller: pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedListView<PushNotificationQuery, PushNotification>.separated(
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            return NotificationSlidableWidget(
              notification: item,
              onReadNotification: onReadNotification,
              onClearNotification: onClearNotification,
              tbContext: tbContext,
              thingsboardClient: thingsboardClient,
              child: NotificationWidget(
                notification: item,
                thingsboardClient: thingsboardClient,
                onClearNotification: onClearNotification,
                onReadNotification: onReadNotification,
                tbContext: tbContext,
              ),
            );
          },
          firstPageProgressIndicatorBuilder: (_) => SizedBox.expand(
            child: Container(
              color: const Color(0x99FFFFFF),
              child: Center(
                child: TbProgressIndicator(
                  tbContext,
                  size: 50.0,
                ),
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (_) =>
              const NoNotificationsFoundWidget(),
        ),
        separatorBuilder: (_, __) => const Divider(thickness: 1),
        state: state,
        fetchNextPage: fetchNextPage,
      ),
    );
  }
}
