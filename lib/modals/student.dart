import 'package:hive/hive.dart';
part 'student.g.dart';
@HiveType(typeId: 0)
class Student extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String mobile;


  Student({required this.email,required this.mobile,required this.name});
}