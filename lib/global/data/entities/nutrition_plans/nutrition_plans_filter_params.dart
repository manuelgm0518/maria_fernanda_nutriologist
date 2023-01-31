import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/utils.dart';

part 'nutrition_plans_filter_params.freezed.dart';
part 'nutrition_plans_filter_params.g.dart';

@freezed
class NutritionPlansFilterParams with _$NutritionPlansFilterParams {
  factory NutritionPlansFilterParams({
    Filters? filters,
    String? name,
  }) = _NutritionPlansFilterParams;

  factory NutritionPlansFilterParams.fromJson(Map<String, dynamic> json) => _$NutritionPlansFilterParamsFromJson(json);
}
