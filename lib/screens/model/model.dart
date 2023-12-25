
import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class DatabaseModel 
{ @HiveField(0) 
  String valume;
  @HiveField(1) 
  String density;
  @HiveField(2) 
  String weight;

  DatabaseModel({required this.density,required this.valume,required this.weight});


}