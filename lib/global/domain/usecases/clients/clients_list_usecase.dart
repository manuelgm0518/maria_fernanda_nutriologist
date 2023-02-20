import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/entities/entities.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class ClientsListUseCase implements UseCase<List<Client>, ClientsFilterParams> {
  final ClientsRepository _clientsRepository;
  ClientsListUseCase(this._clientsRepository);

  @override
  Future<Either<Failure, List<Client>>> call(ClientsFilterParams? params) {
    return _clientsRepository.getAll(params);
  }
}
