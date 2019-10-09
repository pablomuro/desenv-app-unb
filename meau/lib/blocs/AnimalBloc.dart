import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:rxdart/rxdart.dart';

class AnimalBloc extends BlocBase {
  Animal _animal = new Animal();
  File _image;

  AnimalBloc() {
    _animalController.listen((value) => _animal = value);
    _imageController.listen((value) => _image = value);
    setAnimalStream(new Animal());
  }

  var _repository = AnimalService();

  void setAnimal(Animal animal) {
    setAnimalStream(animal);
  }

  var _animalController = BehaviorSubject<Animal>();
  Stream<Animal> get animalStream => _animalController.stream;
  void setAnimalStream(Animal value) => _animalController.sink.add(value);

  var _imageController = BehaviorSubject<File>();
  Stream<File> get imageStrem => _imageController.stream;
  void setImageStream(File value) => _imageController.sink.add(value);

  void setHelpAs(HelpAs value) => _animalController.value.helpAs = value;
  void setName(String value) => _animalController.value.name = value;
  void setType(AnimalType value) => _animalController.value.type = value;
  AnimalType getType() => _animalController.value.type;

  void setSex(AnimalSex value) => _animalController.value.sex = value;
  void setSize(AnimalSize value) => _animalController.value.size = value;
  void setAge(AnimalAge value) => _animalController.value.age = value;
  void setTemper(List<String> value) => _animalController.value.temper = value;
  void setHealth(List<String> value) => _animalController.value.health = value;
  void setNeeds(List<String> value) => _animalController.value.needs = value;
  void setGoals(String value) => _animalController.value.goals = value;
  void setAbout(String value) => _animalController.value.about = value;
  void setAnimalImage(File value) => _animalController.value.animalImage = value;
  // void setOwner(String value) => _animalController.value.owner = value;

  File getPicture() => _animalController.value?.animalImage;

  bool insertOrUpdate() {
    try{
      if (_animal.documentID?.isEmpty ?? true) {
        _repository.add(_animal);
      } else {
        _repository.update(_animal.documentID, _animal);
      }
      return true;
    } on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
    
  }

  @override
  void dispose() {
    _animalController.close();
    super.dispose();
  }
}
