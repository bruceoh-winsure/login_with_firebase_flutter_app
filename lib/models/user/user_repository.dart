import 'package:login_with_firebase_flutter_app/models/user/user.dart';

abstract class UserRepository{
  Future<User> getUser(String uid);
  Future<int> getTest();

}