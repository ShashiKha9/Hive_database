import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_database/modals/student.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'addStudent_page.dart';
class StudentDataPage extends StatefulWidget{
  StudentDataPageState createState()=> StudentDataPageState();
}

class StudentDataPageState extends State<StudentDataPage>{
  List<Student>student=[];
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();






  readStudent(){
    final box =  Hive.box<Student>("student");
   student= box.values.toList();
  }
  deleteStudent(Student stu)  {
    stu.delete();


  }


  @override
  void initState() {
    readStudent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("Student Data"),
  ),
  body: ListView.builder(
    itemCount: student.length,
    itemBuilder: (context,index) {
      return Card(
        child: Row(
          children: [
        Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 10,right: 10),
            child:Text(student[index].name,
              style: GoogleFonts.play(textStyle: TextStyle(fontSize:15,fontWeight: FontWeight.w700)),),
              ),
              Padding(padding: EdgeInsets.only(left: 10,right: 10),
             child: Text(student[index].email,
                 style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize:14,)))
              ),
              Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 16),
             child: Text(student[index].mobile,
                 style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize:14,)))),



            ],

      ),
            Expanded(child:
            TextButton.icon(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddStudentPage( true, index)));

            },
                label: Text("Edit"),
                icon: Icon(CupertinoIcons.pencil)),
            ),
            Expanded(child:
            TextButton.icon(onPressed: ()async{
               final box=Hive.box<Student>("student");
             await  box.delete(index);
            },
                label: Text("Delete"),
                icon: Icon(CupertinoIcons.delete_simple))
            ),





          ]
        )

      );
    }
    )




      );

    }





}
