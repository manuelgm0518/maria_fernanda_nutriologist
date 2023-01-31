import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_plan_create_params.freezed.dart';
part 'nutrition_plan_create_params.g.dart';

@freezed
class NutritionPlanCreateParams with _$NutritionPlanCreateParams {
  factory NutritionPlanCreateParams({
    required String name,
    required String filePath,
  }) = _NutritionPlanCreateParams;

  factory NutritionPlanCreateParams.fromJson(Map<String, dynamic> json) => _$NutritionPlanCreateParamsFromJson(json);
}
