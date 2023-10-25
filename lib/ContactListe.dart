import 'package:flutter/material.dart';
import 'package:widgets/add_contact.dart';
import 'package:widgets/contacy_box.dart';

class Contact_list extends StatefulWidget {
  const Contact_list({super.key});
  @override
  State<Contact_list> createState() => _Contact_listState();
}

class _Contact_listState extends State<Contact_list> {
    List liste=[
    ["1 Contact",false],
    ["2 Contact",false],
    ["3 Contact",false],
    ["4 Contact",false],
    ["5 Contact",false]
  ];
  void change(bool? value,int index){
    setState(() {
      liste[index][1]=value;
    });
  }
  final controller= TextEditingController();
  void saveContact(){
    setState(() {
      liste.add([controller.text,false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }
  void addContact(){
    showDialog(context: context,
     builder: (context){
      return AddContact(controller: controller,
       onAdd: saveContact,
        onCancel: ()=>Navigator.of(context).pop());
     });
  }
  void delContact(index){
    setState(() {
      liste.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Mes contacts"),),
      floatingActionButton:FloatingActionButton(
        onPressed: ()=>addContact(),
        child: Icon(Icons.person),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder:(context,index){
          return ContactBox(
            nomContact: liste[index][0],
            selContact: liste[index][1],
            onChanged: (value)=> change(value, index),
            delContact: (context)=> delContact(index),
            );
        }));
  }
}