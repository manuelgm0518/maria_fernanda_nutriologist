import 'package:dartz/dartz.dart';

import '../../../core/utils/utils.dart';
import '../../data/entities/entities.dart';
import '../models/models.dart';

abstract class NutritionPlansRepository {
  Future<Either<Failure, NutritionPlan>> getById(String id);
  Future<Either<Failure, List<NutritionPlan>>> getFiltered(NutritionPlansFilterParams params);
  Future<Either<Failure, NutritionPlan>> create(NutritionPlanCreateParams params);
  Future<Either<Failure, NutritionPlan>> updateById(String id, NutritionPlanUpdateParams params);
  Future<Either<Failure, NutritionPlan>> deleteById(String id);
}
