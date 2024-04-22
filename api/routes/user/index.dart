import 'dart:io';

import 'package:api/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async{
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(context),
    HttpMethod.post => _createUser(context),
    _ => Future.value(Response(body: 'This is default'))
  };
}

Future<Response> _getUsers(RequestContext context) async{

  final repo = context.read<UserRepostory>();

  final users = await repo.getAll();

  return Future.value(Response.json(
    body: users,
  ));
}

Future<Response> _createUser(RequestContext context)async{
  final json = ( await context.request.json()) as Map<String,dynamic>;
  final username = json['username'] as String?;
  final email = json['email'] as String?;
  final password = json['password'] as String?;

  if(username==null || email==null || password==null){
    return Response.json(
      body: {
        'message':'add name and lastname',
      },
      statusCode: HttpStatus.badRequest
    );
  }
  final repo = context.read<UserRepostory>();
  final user = await repo.createUser(username: username, email: email, password: password);
  return Response.json(
    body: {
      'message':'Create user !',
      'user': user,
    }
  );
}