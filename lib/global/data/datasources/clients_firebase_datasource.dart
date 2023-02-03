import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/utils.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../entities/entities.dart';

class ClientsFirebaseDataSource implements ClientsRepository {
  late final CollectionReference<Client> clientsCollection;

  ClientsFirebaseDataSource() {
    clientsCollection = FirebaseFirestore.instance.collection(Client.tableName).withConverter<Client>(
          toFirestore: (client, _) => client.toJson(),
          fromFirestore: (snapshot, _) => Client.fromJson(snapshot.data()!),
        );
  }

  @override
  Future<Either<Failure, Client>> create(ClientCreateParams params) async {
    try {
      final newClient = Client(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        firstName: params.firstName,
        lastName: params.lastName,
        accessCode: await _getAccessCode(),
      );
      final document = await clientsCollection.add(newClient);
      return Right(newClient.copyWith(id: document.id));
    } on FirebaseException catch (error) {
      return Left(Failure.error(error.message));
    }
  }

  @override
  Future<Either<Failure, Client>> deleteById(String id) async {
    try {
      final document = clientsCollection.doc(id);
      final client = (await document.get()).data();
      await document.delete();
      return Right(client!);
    } on FirebaseException catch (error) {
      return Left(Failure.error(error.message));
    }
  }

  @override
  Future<Either<Failure, Client>> getById(String id) async {
    try {
      final document = clientsCollection.doc(id);
      final client = (await document.get()).data();
      return Right(client!);
    } on FirebaseException catch (error) {
      return Left(Failure.error(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Client>>> getFiltered(ClientsFilterParams filter) async {
    try {
      final documents = await clientsCollection.get();
      final clients = documents.docs.map((e) => e.data()).toList();
      return Right(clients);
    } on FirebaseException catch (error) {
      return Left(Failure.error(error.message));
    }
  }

  @override
  Future<Either<Failure, Client>> updateById(ClientUpdateParams params) async {
    try {
      final document = clientsCollection.doc(params.id);
      await document.update({...params.toJson(), 'updatedAt': DateTime.now()});
      final client = (await document.get()).data();
      return Right(client!);
    } on FirebaseException catch (error) {
      return Left(Failure.error(error.message));
    }
  }

  Future<String> _getAccessCode() async {
    while (true) {
      final accessCode = Random().nextInt(900000) + 100000;
      final exists = await clientsCollection.where('accessCode', isEqualTo: accessCode).get();
      if (exists.size == 0) return accessCode.toString();
    }
  }
}
