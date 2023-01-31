import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/utils.dart';

part 'client.freezed.dart';
part 'client.g.dart';

enum SubscriptionPlan { free, tier1, tier2 }

@freezed
class Client with _$Client {
  const Client._();
  factory Client({
    required Model model,
    required String firstName,
    required String lastName,
    required String accessCode,
    @Default(SubscriptionPlan.free) SubscriptionPlan subscriptionPlan,
  }) = _Client;

  String get fullName => '$firstName $lastName';

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
