import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/contact/ui/contact_details_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';

class HomePageLandscape extends StatefulWidget {
  const HomePageLandscape(this.list, {Key? key}) : super(key: key);

  final List<ContactV1> list;

  @override
  __HomePageLandscapeState createState() => __HomePageLandscapeState();
}

class __HomePageLandscapeState extends State<HomePageLandscape> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
         width: 400,
          child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                selected: index==_selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                leading: CircleAvatar(
                  child: Text(widget.list[index].firstName.characters.first),
                ),
                title: Text(widget.list[index].lastName),
                subtitle: Text(widget.list[index].phone),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: ContactView(
              contact: widget.list[_selectedIndex],
            ),
          ),
        )
      ],
    );
  }
}
