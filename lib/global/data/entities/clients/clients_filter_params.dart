import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/utils.dart';

part 'clients_filter_params.freezed.dart';
part 'clients_filter_params.g.dart';

@freezed
class ClientsFilterParams with _$ClientsFilterParams {
  factory ClientsFilterParams({
    Filters? filters,
    String? name,
  }) = _ClientsFilterParams;

  factory ClientsFilterParams.fromJson(Map<String, dynamic> json) => _$ClientsFilterParamsFromJson(json);
}
