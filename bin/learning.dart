
import 'dart:async';
import 'dart:io';
import 'database_helper.dart';
import
  import
import  '../Lib/Personsdata.dart';
//import 'package:learning/Point.dart';
import 'package:sqlite3/sqlite3.dart';
import 'database_helper.dart';
void greet (String name){
  print("Hi $name");
}

void dateAndTime(){

  print('${DateTime.now()}');

}
Future<void> clearFile(String filePath) async {
  try{
    var myFile = File('/Users/christosntokos/Documents/DartFile.txt');
    await myFile.writeAsString('');
    print('File cleaned succesfully');
  } catch (e){
    print('Error: $e');
  }

}
Future<void> insert(String line) async{
  //int id = 0;
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year,now.month,now.day,now.hour,now.minute,now.second);
  var myFile = File('/Users/christosntokos/Documents/DartFile.txt');
  //var lines = await myFile.readAsLine();
  //var id = <String, int>{};

  var file = myFile.openWrite(mode: FileMode.append) ;
  await myFile.writeAsString("$date\n $line \n",mode: FileMode.append);

  //file.write("$line\n");
  file.close();
}
void main() async{
  String filePath = '/Users/christosntokos/Documents/DartFile.txt';
  //String line = "";
  var myFile = File('/Users/christosntokos/Documents/DartFile.txt');
  //var file = myFile.openWrite() ;
 // file.write(line);
  //file.close();
  //insert('hello');

  await myFile.readAsString().then((String contents){ print(contents);} );
  String a = "Y";
  String b = "Y";
  List<Profile> data = [];
  print('Hello world!');
  //var p1 = Point()

   // ..x = 10
   // ..y = 10;
  //print("enter x:");
//int? x = int.parse(stdin.readLineSync()!);
  //print("enter y:");
 //int? y =  int.parse(stdin.readLineSync()!);
  //p1.move(x, y);
  //p1.show();


//print(p1.x);

for (var i  = 0;  i < 10; i++) {
var s = Stopwatch()..start();
  while (s.elapsedMilliseconds< 200) {
   // do nothing
  }
  print(i);
  dateAndTime();
}
print('If you to clean myFile press Y');
  b = stdin.readLineSync()!;
while (b == "Y") {
 await clearFile(filePath);
 break;
}
print ("If you want to enter a person press Y if not N");
a = stdin.readLineSync()!;
while (a == "Y") {
  print("what is your name?");
  String name = stdin.readLineSync()!;
  print("Enter your surname");
  String surname = stdin.readLineSync()!;
  print("Enter your age:");
  int age = int.parse(stdin.readLineSync()!);
  print("Enter your address:");
  String address = stdin.readLineSync()!;
  data.add(Profile(name, surname, age, address));
  //String test = (name,surname);
  var personInfo = Profile(name, surname, age, address);
  print(personInfo);
  await insert(personInfo.toString());
  print ("If you want to enter a person press Y if not N");
  a = stdin.readLineSync()!;
}
var mySqlfile = DatabaseHelper('/Users/christosntokos/developer/mysqlfiles/sql.db');
mySqlfile.createTable();
mySqlfile.insertUser('Magda', 57);
mySqlfile.deleteUser(2);
var z = mySqlfile.getUsers();
var q = z.length;
print(q);
for (var row in z) {
  print('$row');
}
print(mySqlfile.selectRangeName('Magda'));
mySqlfile.closeDatabase();


for (Profile person in data) {
  print("${person.name}, ${person.surname}, ${person.age},${person.address}");
  }
//greet(name);

}

