import 'dart:convert';

import 'package:api/src/generated/prisma/prisma_client.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class UserRepostory{
  UserRepostory(this._db);

  final PrismaClient _db;

  Future<User?> authUser({
    required String email,
    required String password
})async{
  final user = await _db.user.findFirst(where: UserWhereInput(
    email: StringFilter(equals: email),
    password: StringFilter(equals: _hashPassword(password)),
  ),
  );
  return user;
}

  Future<User?> createUser({
    required String username,
    required String email,
    required String password
})async{
  final user = await _db.user
      .create(data: UserCreateInput(username: username, email: email, password: _hashPassword(password)));
  return user;
}

Future<List<User>> getAll()async{
    final list = await _db.user.findMany();
    return list.toList();
}

String _hashPassword(String password) {
  final encodedPassword = utf8.encode(password);
  return sha256.convert(encodedPassword).toString();
}

int? fetchUserFromToken(String token){
    try{
      final jwt = JWT.verify(token, SecretKey('123456'));
      return jwt.payload as int;
    }on JWTException catch(_){
      return null;
    }
}
}