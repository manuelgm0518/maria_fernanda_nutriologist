import 'package:dartz/dartz.dart';

import '../../../core/utils/utils.dart';
import '../../data/entities/entities.dart';
import '../models/models.dart';

abstract class ClientsRepository {
  Future<Either<Failure, Client>> getById(String id);
  Future<Either<Failure, List<Client>>> getFiltered(ClientsFilterParams filter);
  Future<Either<Failure, Client>> create(ClientCreateParams dto);
  Future<Either<Failure, Client>> updateById(ClientUpdateParams dto);
  Future<Either<Failure, Client>> deleteById(String id);
}
