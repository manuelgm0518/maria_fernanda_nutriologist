import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';
part 'failures.g.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.error([String? message]) = FailureError;
  const factory Failure.unauthorized([String? message]) = FailureUnauthorized;
  const factory Failure.badRequest([String? message]) = FailureBadRequest;
  const factory Failure.notFound([String? message]) = FailureNotFound;

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);
}
