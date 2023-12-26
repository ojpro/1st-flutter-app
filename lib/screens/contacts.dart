import 'package:flutter/material.dart';

class ContactType {
  final int id;
  final String fullName;
  final String phoneNumber;

  ContactType(this.id, this.fullName, this.phoneNumber);
}

class ContactsScreen extends StatelessWidget {
  List<ContactType> contacts = [
    ContactType(1, 'Oussama ELJABBARI', '+212701691713'),
    ContactType(2, 'Moussa ESSALHI', '+217483673'),
    ContactType(3, 'Abd Ellah', '+326273262'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.orange,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) => buildContacts(contacts[index]),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[200],
                  ),
              itemCount: contacts.length)),
    );
  }

  Widget buildContacts(ContactType contact) => Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('${contact.id}'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.fullName),
                Text(contact.phoneNumber),
              ],
            )
          ],
        ),
      );
}
