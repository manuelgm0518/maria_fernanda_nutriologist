import '../../../core/utils/utils.dart';
import '../../domain/models/models.dart';

class ClientsTestDataSource {
  Future<List<Client>> getClients() async {
    await Future.delayed(const Duration(seconds: 1));
    return [Client(model: Model(id: '1234', createdAt: DateTime.now(), updatedAt: DateTime.now()), firstName: 'Yomero', lastName: 'Kwamero', accessCode: '12345')];
  }
}
