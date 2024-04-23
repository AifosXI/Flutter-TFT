import 'package:api/src/generated/prisma/prisma_client.dart';
import 'package:api/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler
      .use(
        requestLogger(),
      )
      .use(
        _providerUserRepo(),
      );
}

final _prisma = PrismaClient(
    datasources: Datasources(
        db: "mysql://root@localhost:3306/tft-flutter"));

Middleware _providerUserRepo(){
  return provider((context) => UserRepostory(_prisma));
}


