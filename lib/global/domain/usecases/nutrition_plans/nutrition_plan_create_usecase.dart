import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/entities/entities.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class NutritionPlanCreateUseCase implements UseCase<NutritionPlan, NutritionPlanCreateParams> {
  final NutritionPlansRepository _nutritionPlansRepository;
  NutritionPlanCreateUseCase(this._nutritionPlansRepository);

  @override
  Future<Either<Failure, NutritionPlan>> call(NutritionPlanCreateParams params) {
    return _nutritionPlansRepository.create(params);
  }
}
