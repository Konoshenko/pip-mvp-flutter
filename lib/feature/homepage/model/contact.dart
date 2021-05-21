class ContactV1 {
  String id;
  String firstName;
  String lastName;
  String phone;
  String email;

  ContactV1({
    this.id = '',
    required this.firstName,
    required this.lastName,
    this.phone = '',
    this.email = '',
  });
}
