import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

import '../../../../../global/domain/models/models.dart';

class NutritionPlanTile extends StatelessWidget {
  final NutritionPlan nutritionPlan;
  const NutritionPlanTile(this.nutritionPlan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nutritionPlan.name),
      subtitle: Text(DateFormat('dd-MM-yyyy').format(nutritionPlan.model.createdAt)),
      trailing: IconButton(
        icon: const Icon(UniconsLine.share),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(nutritionPlan.fileUrl)),
        ),
      ),
    );
  }
}
