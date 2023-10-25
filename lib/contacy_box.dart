import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  String nomContact;
  bool selContact;
  Function(bool?)? onChanged;
  ContactBox({
    super.key,
    required this.nomContact,
    required this.selContact,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Row(children: [
      Checkbox(value: selContact, onChanged: onChanged),
      Text(nomContact),
     ]),
    );
  }
}
