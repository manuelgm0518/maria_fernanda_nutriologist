import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/models.dart';

part 'client_update_params.freezed.dart';
part 'client_update_params.g.dart';

@freezed
class ClientUpdateParams with _$ClientUpdateParams {
  factory ClientUpdateParams(
    String id, {
    String? firstName,
    String? lastName,
    SubscriptionPlan? subscriptionPlan,
  }) = _ClientUpdateParams;

  factory ClientUpdateParams.fromJson(Map<String, dynamic> json) => _$ClientUpdateParamsFromJson(json);
}
