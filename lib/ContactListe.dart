import 'package:flutter/material.dart';
import 'contact.dart'; // Import the Contact class
import 'add_contact.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> list = [];
  final controller = TextEditingController();

  void change(bool? value, int index) {
    setState(() {
      list[index].selContact = value ?? false;
    });
  }

  void saveContact() {
  setState(() {
    list.add(Contact(controller.text, "", 0, "", "", false));
    controller.clear();
    Navigator.of(context).pop();
  });
}


  void addContact() {
    showDialog(
      context: context,
      builder: (context) {
        return AddContact(
          controller: controller,
          onAdd: saveContact,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void delContact(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void showContactDetails(Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Détails du contact"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(contact.photo), // Set the correct image path
                radius: 50,
              ),
              Text("Nom: ${contact.nom}"),
              Text("Prénom: ${contact.prenom}"),
              Text("Âge: ${contact.age.toString()}"),
              Text("Email: ${contact.email}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes contacts")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(),
        child: Icon(Icons.person),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(list[index].photo), 
            ),
            title: Text(list[index].nom),
            onTap: () {
              showContactDetails(list[index]);
            },
          );
        },
      ),
    );
  }
}
