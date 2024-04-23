import 'package:flutter/widgets.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late User user;

  void updateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}