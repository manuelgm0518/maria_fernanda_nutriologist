import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../global/data/entities/entities.dart';
import '../../../../../../global/domain/models/models.dart';
import '../../../../../../global/domain/usecases/usecases.dart';

part 'clients_page_event.dart';
part 'clients_page_state.dart';
part 'clients_page_bloc.freezed.dart';

class ClientsPageBloc extends Bloc<ClientsPageEvent, ClientsPageState> {
  //final ClientsListUseCase clientsListUseCase;
  final ClientsWatchUseCase clientsWatchUseCase;

  List<Client> _clients = [];
  Stream<List<Client>>? _clientsStream;

  ClientsPageBloc({
    required this.clientsWatchUseCase,
  }) : super(const _LoadSuccess([])) {
    on<_ClientsWatched>((event, emit) async {
      final res = await clientsWatchUseCase.call(null);
      res.fold((l) => (l) => emit(_LoadFailure(l.message)), (r) {
        _clientsStream = r;
        add(const _ClientsListed(null));
        // return emit.forEach(r, onData: (data) {
        //   return _LoadSuccess(data);
        // });
        //r.first.then((value) => print(value));
      });
    });

    on<_ClientsListed>(((event, emit) async {
      if (_clientsStream != null) {
        await emit.forEach(_clientsStream!, onData: (data) {
          return _LoadSuccess(data);
        });
      }
    }));

    add(const _ClientsWatched(null));

    // on<_ClientsListed>((event, emit) async {
    //   // await emit.forEach(onData: ((List<MyObject> messages) {
    //   //   return state.copyWith(messages: List.from(messages));
    //   // }));

    //   // emit(const _LoadInProgress());
    //   // final res = await clientsListUseCase.call(event.params);
    //   // res.fold((l) => emit(_LoadFailure(l.message)), (r) {
    //   //   _clients = r;
    //   //   emit(_LoadSuccess(_clients));
    //   // });
    // });

    //add(const ClientsPageEvent.clientsListed(null));
    // on<_ClientAdded>((event, emit) async {
    //   emit(const _LoadInProgress());
    //   final res = await clientCreateUseCase.call(event.params);
    //   res.fold((l) => emit(_LoadFailure(l.message)), (r) {
    //     _clients.insert(0, r);
    //     emit(_LoadSuccess(_clients));
    //   });
    // });
    // on<_ClientUpdated>((event, emit) async {
    //   emit(const _LoadInProgress());
    //   final res = await clientUpdateUseCase.call(event.params);
    //   res.fold((l) => emit(_LoadFailure(l.message)), (r) {
    //     _clients[_clients.indexWhere((element) => element.id == event.params.id)] = r;
    //     emit(_LoadSuccess(_clients));
    //   });
    // });
    // on<_ClientDeleted>((event, emit) async {
    //   emit(const _LoadInProgress());
    //   final res = await clientDeleteUseCase.call(event.id);
    //   res.fold((l) => emit(_LoadFailure(l.message)), (r) {
    //     _clients.removeWhere((element) => element.id == event.id);
    //     emit(_LoadSuccess(_clients));
    //   });
    // });
  }
}
