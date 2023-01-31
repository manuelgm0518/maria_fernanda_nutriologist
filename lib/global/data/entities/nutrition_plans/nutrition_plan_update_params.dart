import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_plan_update_params.freezed.dart';
part 'nutrition_plan_update_params.g.dart';

@freezed
class NutritionPlanUpdateParams with _$NutritionPlanUpdateParams {
  factory NutritionPlanUpdateParams(
    String id, {
    String? name,
    String? filePath,
  }) = _NutritionPlanUpdateParams;

  factory NutritionPlanUpdateParams.fromJson(Map<String, dynamic> json) => _$NutritionPlanUpdateParamsFromJson(json);
}
