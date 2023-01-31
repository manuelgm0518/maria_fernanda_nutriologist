import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_create_params.freezed.dart';
part 'client_create_params.g.dart';

@freezed
class ClientCreateParams with _$ClientCreateParams {
  factory ClientCreateParams({
    required String firstName,
    required String lastName,
  }) = _ClientCreateParams;

  factory ClientCreateParams.fromJson(Map<String, dynamic> json) => _$ClientCreateParamsFromJson(json);
}
