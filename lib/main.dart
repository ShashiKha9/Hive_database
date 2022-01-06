import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/modals/student.dart';
import 'package:hive_database/pages/addStudent_page.dart';
import 'package:hive_database/pages/studentData_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>("student");


  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home: StudentDataPage(),
)    ;
  }
}


