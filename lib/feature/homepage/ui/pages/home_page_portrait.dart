import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/contact/ui/contact_details_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';

class HomePagePortrait extends StatefulWidget {
  const HomePagePortrait(this.list, {Key? key}) : super(key: key);

  final List<ContactV1> list;

  @override
  __HomePagePortraitState createState() => __HomePagePortraitState();
}

class __HomePagePortraitState extends State<HomePagePortrait> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              ContactDetailsScreen.routName,
              arguments: widget.list[index],
            );
          },
          leading: CircleAvatar(
            child: Text(widget.list[index].firstName.characters.first),
          ),
          title: Text(widget.list[index].lastName),
          subtitle: Text(widget.list[index].phone),
        );
      },
    );
  }
}
