import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_database/modals/student.dart';
import 'package:hive/hive.dart';

import 'package:hive_database/pages/studentData_page.dart';
class AddStudentPage extends StatefulWidget{
    bool isEdit;
    int pos=-1;
   AddStudentPage( this.isEdit,this.pos);
  AddStudentPageState createState()=> AddStudentPageState();

}
class AddStudentPageState extends State<AddStudentPage>{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  var box = Hive.box<Student>("student");

  final _formkey = GlobalKey<FormState>();
  Future addStudent() async{
    final student = Student(
        email: emailController.text,
        mobile: mobileNoController.text,
        name: nameController.text);


      box.add(student);







  }


  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: Form(
     key: _formkey,
       child:Column(
         children: [
           Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 40),
     child: TextFormField(
       controller: nameController,
       keyboardType: TextInputType.name,
       decoration: InputDecoration(
         hintText: "Name"
       ),
       validator: (value){
         if(value!.isEmpty){
           return"Please enter the name";
         }
       },
     ),
           ),
           Padding(padding: EdgeInsets.only(top: 10,left: 20,right: 20),
             child: TextFormField(
               controller: emailController,
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                   hintText: "Email"
               ),
               validator: (value){
                 if(value!.isEmpty){
                   return"Please enter the email";
                 }
               },
             ),
           ),
           Padding(padding: EdgeInsets.only(top:10,left: 20,right: 20),
             child: TextFormField(
               controller: mobileNoController,
               keyboardType: TextInputType.phone,
               decoration: InputDecoration(
                   hintText: "Phone No"
               ),
               validator: (value){
                 if(value!.isEmpty){
                   return"Please enter the no";
                 }
               },
             ),
           ),

           ElevatedButton(onPressed: (){
             if(_formkey.currentState!.validate()) {
               if (emailController.text.isNotEmpty &
               mobileNoController.text.isNotEmpty &
               nameController.text.isNotEmpty) {
                 if (widget.isEdit) {
                   final student = Student(
                       email: emailController.text,
                       mobile: mobileNoController.text,
                       name: nameController.text);
                   box.putAt(widget.pos, student);
                   student.save();
                 } else {
                   addStudent();
                 }
                 Navigator.pushReplacement(context, MaterialPageRoute(
                     builder: (context) => StudentDataPage()));
               }
             }
           },
               child: Text("Submit"))

         ],
       ) ),

 ) ;
  }

}
