import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/profile_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/cubit/contact_list_cubit.dart';
import 'package:pip_mvp_flutter/feature/homepage/repository/contact_repository.dart';
import 'package:pip_mvp_flutter/feature/homepage/ui/pages/home_page_landscape.dart';
import 'package:pip_mvp_flutter/feature/homepage/ui/pages/home_page_portrait.dart';

class MyHomePage extends StatefulWidget {
  static const String routName = '/home_screen';

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Pip Sample'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, ProfileScreen.routName),
              child: CircleAvatar(
                child: Icon(Icons.people_outline_outlined),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ContactListCubit, ContactListState>(
          bloc: ContactListCubit(ContactRepositoryMock()),
          builder: (contact, state) {
            if (state is ContactListData) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return constraints.maxWidth < 800
                      ? HomePagePortrait(state.listContact)
                      : HomePageLandscape(state.listContact);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
