import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../global/data/entities/entities.dart';
import '../../../../../global/domain/models/models.dart';
import '../../../../../global/domain/usecases/usecases.dart';

part 'clients_view_event.dart';
part 'clients_view_state.dart';
part 'clients_view_bloc.freezed.dart';

class ClientsViewBloc extends Bloc<ClientsViewEvent, ClientsViewState> {
  final ClientsFilterUseCase clientsFilterUseCase;
  final ClientCreateUseCase clientCreateUseCase;
  final ClientUpdateUseCase clientUpdateUseCase;
  final ClientDeleteUseCase clientDeleteUseCase;

  List<Client> _clients = [];

  ClientsViewBloc({
    required this.clientsFilterUseCase,
    required this.clientCreateUseCase,
    required this.clientUpdateUseCase,
    required this.clientDeleteUseCase,
  }) : super(const _Initial()) {
    on<_ClientsFiltered>((event, emit) async {
      emit(const _LoadInProgress());
      final res = await clientsFilterUseCase.call(event.params);
      res.fold((l) => emit(_LoadFailure(l.message)), (r) {
        _clients = r;
        emit(_LoadSuccess(_clients));
      });
    });
    on<_ClientAdded>((event, emit) async {
      emit(const _LoadInProgress());
      final res = await clientCreateUseCase.call(event.params);
      res.fold((l) => emit(_LoadFailure(l.message)), (r) {
        _clients.insert(0, r);
        emit(_LoadSuccess(_clients));
      });
    });
    on<_ClientUpdated>((event, emit) async {
      emit(const _LoadInProgress());
      final res = await clientUpdateUseCase.call(event.params);
      res.fold((l) => emit(_LoadFailure(l.message)), (r) {
        _clients[_clients.indexWhere((element) => element.id == event.params.id)] = r;
        emit(_LoadSuccess(_clients));
      });
    });
    on<_ClientDeleted>((event, emit) async {
      emit(const _LoadInProgress());
      final res = await clientDeleteUseCase.call(event.id);
      res.fold((l) => emit(_LoadFailure(l.message)), (r) {
        _clients.removeWhere((element) => element.id == event.id);
        emit(_LoadSuccess(_clients));
      });
    });
  }
}
