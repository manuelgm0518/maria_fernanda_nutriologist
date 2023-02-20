import 'package:dartz/dartz.dart';

import '../../../core/utils/utils.dart';
import '../../data/entities/entities.dart';
import '../models/models.dart';

abstract class ClientsRepository {
  Future<Either<Failure, Stream<List<Client>>>> watch(ClientsFilterParams? filter);
  Future<Either<Failure, Client>> getById(String id);
  Future<Either<Failure, List<Client>>> getAll(ClientsFilterParams? filter);
  Future<Either<Failure, Client>> create(ClientCreateParams params);
  Future<Either<Failure, Client>> updateById(ClientUpdateParams params);
  Future<Either<Failure, Client>> deleteById(String id);
}
