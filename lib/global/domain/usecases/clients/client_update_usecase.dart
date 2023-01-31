import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/entities/entities.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class ClientUpdateUseCase implements UseCase<Client, ClientUpdateParams> {
  final ClientsRepository _clientsRepository;
  ClientUpdateUseCase(this._clientsRepository);

  @override
  Future<Either<Failure, Client>> call(ClientUpdateParams params) {
    return _clientsRepository.updateById(params);
  }
}
