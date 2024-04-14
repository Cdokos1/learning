import 'dart:ffi';

class Profile {
  String name = "";
  String surname = "";
  int age = 0;
  String address = "";
  //String output = "";
  //List<dynamic> data = [];

 Profile(this.name,this.surname, this.age, this.address);
  //List<dynamic>data= [];
  @override
  String toString(){
    return"name:$name\n surname: $surname\n age: $age\n address: $address";
  }
  //Profile.data();
  //String output = data.join(" ");



}