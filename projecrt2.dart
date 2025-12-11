
import 'dart:io';
  List<Map<String ,dynamic>> StudentList=[];
 void main(){
  int i;
  Map<String, int>marks={};
  int total=0;
  while(true){
    stdout.write("enter student name");
    String name= stdin.readLineSync()!;
       stdout.write("enter roll number");
       int roll=int.parse(stdin.readLineSync()!);
       stdout.write("enter marks");
       for(i=1;i<=5;i++){
         stdout.write("Sub $i :");
          int m =int.parse(stdin.readLineSync()!);
           marks["sub$i"]=m;
           
            total +=m;

       }
        double per=total/5;
    Map<String,dynamic> student={
      "name":name,
         "roll":roll,
         "marks":marks,
         "total":total,
         "percantage":per
      };
      StudentList.add(student);
       print("=====Student Details==========\n");
       for(var s in StudentList){
        print("Name : ${s['name']}\n Roll : ${s['roll']}\n Marks : ${s['marks']}\nTotal :${s['name']}\nPercantages: ${s['percantage']} ");
          if(per>=60){
            print("First");
          }
          else if(per>=45){
            print("Second");
          }
          else if(per>=33){
              print("Third");
          }
          else{
               print("Failed");
          }
       }
        
  }
}