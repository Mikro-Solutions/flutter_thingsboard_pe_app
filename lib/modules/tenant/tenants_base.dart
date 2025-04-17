import 'package:systemat_app/core/entity/entities_base.dart';
import 'package:systemat_app/thingsboard_client.dart';

mixin TenantsBase on EntitiesBase<Tenant, PageLink> {
  @override
  String get title => 'Tenants';

  @override
  String get noItemsFoundText => 'No tenants found';

  @override
  Future<PageData<Tenant>> fetchEntities(PageLink pageKey) {
    return tbClient.getTenantService().getTenants(pageKey);
  }

  @override
  void onEntityTap(Tenant entity) {
    navigateTo('/tenant/${entity.id!.id}');
  }
}
