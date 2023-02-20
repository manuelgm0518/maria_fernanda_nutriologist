import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

import '../../../../global/domain/models/models.dart';

class NutritionPlansList extends StatelessWidget {
  final List<NutritionPlan> nutritionPlans;
  const NutritionPlansList({required this.nutritionPlans, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return nutritionPlans.isEmpty
        ? Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(UniconsLine.ban, size: 64),
            const Text('Not registered clients found'),
            ElevatedButton.icon(
              icon: const Icon(UniconsLine.user_plus),
              label: const Text('Register new client'),
              onPressed: () {}, // => AutoRouter.of(context).pushWidget(const ClientForm()),
            )
          ])
        : ListView.builder(
            itemCount: nutritionPlans.length,
            itemBuilder: (context, index) {
              final nutritionPlan = nutritionPlans[index];
              return _NutritionPlanTile(
                nutritionPlan: nutritionPlan,
                onTap: () {}, //=> AutoRouter.of(context).pushWidget(NutritionPlanForm(nutritionplan: nutritionplan)),
              );
            },
          );
  }
}

class _NutritionPlanTile extends StatelessWidget {
  final NutritionPlan nutritionPlan;
  final void Function() onTap;
  const _NutritionPlanTile({required this.nutritionPlan, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nutritionPlan.name),
      subtitle: Text(DateFormat('dd-MM-yyyy').format(nutritionPlan.createdAt)),
      onTap: onTap,
    );
  }
}
