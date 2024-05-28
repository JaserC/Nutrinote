import 'package:uuid/uuid.dart';

typedef UUIDString = String;

//This class will generate a unique identification string using the Uuid library
class UUIDMaker {
  static const uuid = Uuid();

  //This method will generate a string that is randomized such that it is highly improbable that 2 different generated strings are the same
  //This provides us with a unique id for each journal such that we can distinguish them with a nearly fool-proof identifier
  static UUIDString generateUUID() {
    return uuid.v4();
  }
}
