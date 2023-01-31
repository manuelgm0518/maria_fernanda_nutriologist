import 'package:dartz/dartz.dart';

import '../../../../core/utils/utils.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class ClientDeleteUseCase implements UseCase<Client, String> {
  final ClientsRepository _clientsRepository;
  ClientDeleteUseCase(this._clientsRepository);

  @override
  Future<Either<Failure, Client>> call(String id) {
    return _clientsRepository.deleteById(id);
  }
}
