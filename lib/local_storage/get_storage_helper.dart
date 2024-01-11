
import 'package:get_storage/get_storage.dart';

class GetStorageHelper{

  static final box = GetStorage();

  static clearBox(){
    box.erase();
  }

  static Future<void> remove(String key) async {
      await box.remove(key);
  }

  static Map<String,dynamic>? getFromLocal(String key){
    return box.read(key);
  }

  static bool getBool(String key){
    return box.read(key)??false;
  }

  static String? getString(String key){
    return box.read(key);
  }

  static insert(String key,dynamic data){
    box.write(key, data);
  }

}