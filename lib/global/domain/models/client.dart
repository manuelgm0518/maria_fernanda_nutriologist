import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/utils.dart';

part 'client.freezed.dart';
part 'client.g.dart';

enum SubscriptionPlan { free, tier1, tier2 }

@freezed
class Client with _$Client {
  static String tableName = 'clients';
  const Client._();

  @Implements<Model>()
  const factory Client({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String firstName,
    required String lastName,
    required String accessCode,
    @Default(SubscriptionPlan.free) SubscriptionPlan subscriptionPlan,
  }) = ClientModel;

  String get fullName => '$firstName $lastName';

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
