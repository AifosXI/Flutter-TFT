import 'package:api/src/generated/prisma/prisma_client.dart';
import 'package:api/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';

Handler middleware(Handler handler) {
  return handler.use(
        _providerAuthentication(),
      );
}

Middleware _providerAuthentication(){
  return bearerAuthentication<int>(
      authenticator: (context, token) async {
        return context.read<UserRepostory>().fetchUserFromToken(token);
      }
  );
}