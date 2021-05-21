part of 'contact_list_cubit.dart';

abstract class ContactListState extends Equatable {
  const ContactListState();
}

class ContactListData extends ContactListState {
  final List<ContactV1> listContact;

  const ContactListData(this.listContact);
  @override
  List<Object> get props => [];
}

class ContactListError extends ContactListState {
  final String error;

  const ContactListError(this.error);

  @override
  List<Object> get props => [error];
}

class ContactListLoading extends ContactListState {
  @override
  List<Object> get props => [];
}
