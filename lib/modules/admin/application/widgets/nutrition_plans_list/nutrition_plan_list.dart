import 'package:flutter/material.dart';

import '../../../../../global/domain/models/models.dart';
import 'nutrition_plan_tile.dart';

class NutritionPlanList extends StatelessWidget {
  final List<NutritionPlan> nutritionPlans;
  const NutritionPlanList(this.nutritionPlans, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nutritionPlans.length,
      itemBuilder: (context, index) {
        final nutritionPlan = nutritionPlans[index];
        return NutritionPlanTile(nutritionPlan);
      },
    );
  }
}
