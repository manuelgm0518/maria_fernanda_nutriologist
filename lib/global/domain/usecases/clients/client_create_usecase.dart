import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/entities/entities.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class ClientCreateUseCase implements UseCase<Client, ClientCreateParams> {
  final ClientsRepository _clientsRepository;
  ClientCreateUseCase(this._clientsRepository);

  @override
  Future<Either<Failure, Client>> call(ClientCreateParams params) {
    return _clientsRepository.create(params);
  }
}
