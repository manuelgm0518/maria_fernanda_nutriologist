import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/utils.dart';

part 'nutrition_plan.freezed.dart';
part 'nutrition_plan.g.dart';

@freezed
class NutritionPlan with _$NutritionPlan {
  static String tableName = 'nutrition_plans';
  const NutritionPlan._();

  @Implements<Model>()
  const factory NutritionPlan({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    required String fileUrl,
  }) = NutritionPlanModel;

  factory NutritionPlan.fromJson(Map<String, dynamic> json) => _$NutritionPlanFromJson(json);
}
