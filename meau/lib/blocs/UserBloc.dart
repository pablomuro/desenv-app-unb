import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/UserService.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  User _user = new User();

  UserBloc() {
    _userController.listen((value) => _user = value);
    setUserStream(new User());
  }

  var _repository = UserService();

  void setUser(User user) {
    setUserStream(user);
  }

  var _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;
  void setUserStream(User value) => _userController.sink.add(value);

  void setName(String value) => _userController.value.name = value;
  void setAge(int value) => _userController.value.age = value;
  void setEmail(String value) => _userController.value.email = value;
  void setState(String value) => _userController.value.state = value;
  void setCity(String value) => _userController.value.city = value;
  void setAdrress(String value) => _userController.value.adrress = value;
  void setPhone(String value) => _userController.value.phone = value;
  void setUsername(String value) => _userController.value.username = value;
  void setPassword(String value) => _userController.value.password = value;
  void setConfirmPassword(String value) => _userController.value.confirmPassword = value;
  void setPicture(File value) => _userController.value.profileImage = value;

  File getPicture() => _userController.value.profileImage;

  bool insertOrUpdate() {
    if (_user.documentID?.isEmpty ?? true) {
      _repository.add(_user);
    } else {
      _repository.update(_user.documentID, _user);
    }

    return true;
  }

  bool confirmPassword(){
    if( (_user.password != null && _user.confirmPassword != null) && (_user.password == _user.confirmPassword)){
        return true;
    }
    return false;
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
