class ContactV1 {
  String id;
  String firstName;
  String lastName;
  String phone;
  String email;

  ContactV1({
    required this.firstName,
    required this.lastName,
    this.id = '',

    this.phone = '',
    this.email = '',
  });
}
