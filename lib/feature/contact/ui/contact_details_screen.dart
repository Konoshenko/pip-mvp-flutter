import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/contact/ui/components/item_contact_info_list.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';

class ContactDetailsScreen extends StatefulWidget {
  static const String routName = '/contact_details_screen';
  final ContactV1 contact;

  const ContactDetailsScreen(this.contact, {Key? key}) : super(key: key);

  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.contact.firstName} ${widget.contact.lastName}'),
      ),
      body: ContactView(contact: widget.contact),
    );
  }
}

class ContactView extends StatelessWidget {
  const ContactView({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final ContactV1 contact;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            minRadius: 60,
            child: Text(
              contact.firstName.characters.first,
              style: TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(height: 30),
          ItemContactInfo(
              name: 'Name',
              info: '${contact.firstName} ${contact.lastName} ',
              icon: Icons.person),
          ItemContactInfo(name: 'Phone', info: contact.phone, icon: Icons.phone),
          ItemContactInfo(name: 'Email', info: contact.email, icon: Icons.email),
        ],
      ),
    );
  }
}
