import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/UserService.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  User _user;

  UserBloc() {
    _userController.listen((value) => _user = value);
  }

  var _repository = UserService();

  void setPerson(User user) {
    _user = user;
  }

  var _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;

  void setUserStream(User value) => _userController.sink.add(value);

  bool insertOrUpdate() {
    if (_user.documentID?.isEmpty ?? true) {
      _repository.add(_user);
    } else {
      _repository.update(_user.documentID, _user);
    }

    return true;
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
