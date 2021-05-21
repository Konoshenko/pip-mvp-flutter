import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';
import 'package:pip_mvp_flutter/feature/homepage/repository/contact_repository_interface.dart';

part 'contact_list_state.dart';

class ContactListCubit extends Cubit<ContactListState> {
  ContactListCubit(this._contactRepository) : super(ContactListData([])) {
    fetchContacts();
  }

  IContactRepository _contactRepository;

  Future<void> fetchContacts() async {
    try {
      emit(ContactListLoading());
      final contactList = await _contactRepository.getContact();
      emit(ContactListData(contactList));
    } catch (err) {
      emit(ContactListError(err.toString()));
    }
  }
}
