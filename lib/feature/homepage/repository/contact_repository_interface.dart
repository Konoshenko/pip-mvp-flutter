import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';

abstract class IContactRepository {
  Future<List<ContactV1>> getContact();
}
