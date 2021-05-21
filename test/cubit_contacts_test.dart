import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pip_mvp_flutter/feature/homepage/cubit/contact_list_cubit.dart';
import 'package:pip_mvp_flutter/feature/homepage/repository/contact_repository_interface.dart';
import 'package:pip_mvp_flutter/utils/mock.dart';

import 'test_contacts_cubit.mocks.dart';

@GenerateMocks([IContactRepository])
void main() {
  final contactRepo = MockIContactRepository();
  setUpAll(() {});

  group('ContactCubit', () {
    blocTest(
      'Get contact list without errors',
      build: () {
        when(contactRepo.getContact())
            .thenAnswer((_) => Future.value(mockContactList));
        return ContactListCubit(contactRepo);
      },
      act: (ContactListCubit cubit) => cubit.fetchContacts(),
      expect: () => [ContactListData(mockContactList)],
    );

    blocTest(
      'Getting contact list with unknown error',
      build: () {
        when(contactRepo.getContact()).thenThrow(Exception());
        return ContactListCubit(contactRepo);
      },
      act: (ContactListCubit cubit) => cubit.fetchContacts(),
      expect: () =>
          [ContactListLoading(), ContactListError(Exception().toString())],
    );
  });
}
