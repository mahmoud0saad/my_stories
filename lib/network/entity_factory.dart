import 'models/StoriesResponse.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    print("mano saf ${T.toString()}  json  ${json.toString()}");
    if (1 == 0) {
      return null;
    }else if (T.toString() == "StoriesResponse") {
      print("StoriesResponse json EntityFactory   ${json}");

      return StoriesResponse.fromMap(json) as T;
    }else if (T.toString() == "StoriesResponse\$") {
      print("StoriesResponse json EntityFactory   ${json}");

      return StoriesResponse.fromMap(json) as T;
    } else {
      return null;
    }
  }
}
