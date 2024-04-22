import 'dart:io';

import 'package:api/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

Future<Response> onRequest(RequestContext context) async{
  return switch (context.request.method) {
    HttpMethod.post => _authUser(context),
    _ => Future.value(Response(body: 'This is default'))
  };
}

Future<Response> _authUser(RequestContext context)async{
  final json = ( await context.request.json()) as Map<String,dynamic>;
  final email = json['email'] as String?;
  final password = json['password'] as String?;

  if(email==null || password==null){
    return Response.json(
        body: {
          'message':'email, password',
        },
        statusCode: HttpStatus.badRequest
    );
  }
  final repo = context.read<UserRepostory>();
  final user = await repo.authUser(
      email: email,
      password: password
  );
  if(user==null){
    return Response.json(
        body: {
          'message':'User not found !',
        },
        statusCode: HttpStatus.notFound
    );
  }
  final jwt = JWT(user.id);
  final token = jwt.sign(SecretKey('123456'));
  return Response.json(
      body: {
        'user': user,
        'token': token
      },
  );
}

