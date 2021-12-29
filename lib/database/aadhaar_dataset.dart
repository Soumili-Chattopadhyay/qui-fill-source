class Aadhaar {
  String id, name, phone, mail, address;

  Aadhaar({
    required this.id,
    required this.name,
    required this.phone,
    required this.mail,
    required this.address,
  });
}

List<Aadhaar> aadhaarDataset = [
  Aadhaar(
    id: "123456789211",
    name: "Soumili Chattopadhyay",
    phone: "7894561230",
    mail: "name.surname@xyz.com",
    address: "Rajasthan, India",
  ),
];
