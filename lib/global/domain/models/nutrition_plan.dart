import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/utils.dart';

part 'nutrition_plan.freezed.dart';
part 'nutrition_plan.g.dart';

@freezed
class NutritionPlan with _$NutritionPlan {
  factory NutritionPlan({
    required Model model,
    required String name,
    required String fileUrl,
  }) = _NutritionPlan;

  factory NutritionPlan.fromJson(Map<String, dynamic> json) => _$NutritionPlanFromJson(json);
}
