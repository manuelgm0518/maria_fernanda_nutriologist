import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/entities/entities.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class ClientsWatchUseCase implements UseCase<Stream<List<Client>>, ClientsFilterParams> {
  final ClientsRepository _clientsRepository;
  ClientsWatchUseCase(this._clientsRepository);

  @override
  Future<Either<Failure, Stream<List<Client>>>> call(ClientsFilterParams? params) {
    return _clientsRepository.watch(params);
  }
}
