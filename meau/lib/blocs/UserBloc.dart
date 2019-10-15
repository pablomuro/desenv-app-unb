import 'dart:typed_data';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/UserService.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  User _user = new User();
  Uint8List _image;

  UserBloc() {
    _userController.listen((value) => _user = value);
    _imageController.listen((value) => _image = value);
    setUserStream(new User());
  }

  var _repository = UserService();

  void setUser(User user) {
    setUserStream(user);
  }

  var _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;
  void setUserStream(User value) => _userController.sink.add(value);

  var _imageController = BehaviorSubject<Uint8List>();
  Stream<Uint8List> get imageStrem => _imageController.stream;
  void setImageStream(Uint8List value) => _imageController.sink.add(value);

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
  void setPicture(Uint8List value) => _userController.value.profileImage = value;

  Uint8List getPicture() => _userController.value?.profileImage;

  Future<bool> insertOrUpdate() async {
    try{
      if (_user.documentID?.isEmpty ?? true) {
        bool retorno = await _repository.add(_user);
        return retorno;
      } else {
        _repository.update(_user.documentID, _user);
      }
      return true;
    } on Exception catch (e){
      throw new Exception(e);
    }
  }

  String validatePassword(){
    if( (_user.password != null && _user.confirmPassword != null) && (_user.password == _user.confirmPassword)){
      if((_user.password.length < 6 || _user.confirmPassword.length < 6)){
        return 'senha tem que ter mais de 6 caracteres';
      }
        return null;
    }
    return 'Senhas não são iguais';
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
