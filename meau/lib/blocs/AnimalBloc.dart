
import 'dart:typed_data';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:rxdart/rxdart.dart';

class AnimalBloc extends BlocBase {
  Animal _animal = new Animal();
  Uint8List _image;

  AnimalBloc(){
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

  var _imageController = BehaviorSubject<Uint8List>();
  Stream<Uint8List> get imageStrem => _imageController.stream;
  void setImageStream(Uint8List value) => _imageController.sink.add(value);

  void setHelpAs(HelpAs value) => _animalController.value.helpAs = value;
  void setName(String value) => _animalController.value.name = value;
  void setType(AnimalType value) => _animalController.value.type = value;
  AnimalType getType() => _animalController.value.type;

  void setSex(AnimalSex value) => _animalController.value.sex = value;
  void setSize(AnimalSize value) => _animalController.value.size = value;
  void setAge(AnimalAge value) => _animalController.value.age = value;

  void addTemper(String value) => _animalController.value.temper.add(value);
  void removeTemper(String value) => _animalController.value.temper.remove(value);
  bool hasTemper(String value) => _animalController.value.temper != null && _animalController.value.temper.contains(value);

  void addHealth(String value) => _animalController.value.health.add(value);
  void removeHealth(String value) => _animalController.value.health.remove(value);
  bool hasHealth(String value) => _animalController.value.health != null && _animalController.value.health.contains(value);

  void addNeeds(String value) => _animalController.value.needs.add(value);
  void removeNeeds(String value) => _animalController.value.needs.remove(value);
  bool hasNeeds(String value) => _animalController.value.needs != null && _animalController.value.needs.contains(value);

  void setGoals(String value) => _animalController.value.goals = value;
  void setAbout(String value) => _animalController.value.about = value;
  void setAnimalImage(Uint8List value) => _animalController.value.animalImage = value;
  // void setOwner(String value) => _animalController.value.owner = value;

  Uint8List getPicture() => _animalController.value?.animalImage;

  Future<bool> insertOrUpdate() async {
    try{
      if (_animal.documentID?.isEmpty ?? true) {
        return await _repository.add(_animal);
      } else {
        return await _repository.update(_animal.documentID, _animal);
      }
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
