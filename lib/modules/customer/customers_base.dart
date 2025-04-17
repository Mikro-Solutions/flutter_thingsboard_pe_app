import 'package:systemat_app/core/entity/entities_base.dart';
import 'package:systemat_app/thingsboard_client.dart';

mixin CustomersBase on EntitiesBase<Customer, PageLink> {
  @override
  String get title => 'Customers';

  @override
  String get noItemsFoundText => 'No customers found';

  @override
  Future<PageData<Customer>> fetchEntities(PageLink pageKey) {
    return tbClient.getCustomerService().getCustomers(pageKey);
  }

  @override
  void onEntityTap(Customer entity) {
    navigateTo('/customer/${entity.id!.id}');
  }
}
