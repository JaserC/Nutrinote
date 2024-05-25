import 'package:food_focus/src/utils/uuid_generator.dart';
import 'package:food_focus/src/utils/find_position.dart';
import 'package:hive/hive.dart';

part 'snap.g.dart';

@HiveType(typeId: 1, adapterName: "SnapAdapter")
class Snap {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String nutrition;

  @HiveField(2)
  final String imgURI;

  @HiveField(3)
  late double latitude; //How to handle case when unknown

  @HiveField(4)
  late double longitude; //How to handle case when unknown

  @HiveField(5)
  final UUIDString uuid;

  @HiveField(6)
  final DateTime createdAt;

  Snap({
    required this.name,
    required this.nutrition,
    required this.imgURI,
    required this.latitude,
    required this.longitude,
    required this.uuid,
    required this.createdAt,
  });

  //How do these constructors work together?
  //Do I want to call getLocation from within constructor or before that and pass the results into the constructor?

  Snap.defaultConstructor(
      {String name = "", String nutrition = "", String imgURI = ""})
      : name = name,
        imgURI = imgURI,
        nutrition = nutrition,
        uuid = UUIDMaker.generateUUID(),
        createdAt = DateTime.now() {
    PositionFinder.determinePosition().then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
    }).onError((error, stackTrace) {
      latitude = 0.0;
      longitude = 0.0;
    });
  }
}
