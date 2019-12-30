import 'package:login_with_firebase_flutter_app/models/user/user.dart';
import 'package:login_with_firebase_flutter_app/models/user/user_repository.dart';

class DataUserRepository extends UserRepository{
  User user;

  static DataUserRepository _instance = DataUserRepository._internal();
  DataUserRepository._internal() {
  }
  factory DataUserRepository() => _instance;

  
  @override
  Future<List<User>> getAllUsers() {
    
  }

  @override
  Future<User> getUser(String uid) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<int> getTest() async {
    
    
    return null;
  }

}