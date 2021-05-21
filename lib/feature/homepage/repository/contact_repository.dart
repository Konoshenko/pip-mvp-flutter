import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';
import 'package:pip_mvp_flutter/feature/homepage/repository/contact_repository_interface.dart';
import 'package:pip_mvp_flutter/utils/mock.dart';

class ContactRepositoryMock extends IContactRepository {
  ContactRepositoryMock();

  @override
  Future<List<ContactV1>> getContact() {
    return Future.delayed(Duration(seconds: 2), () => mockContactList);
  }
}
