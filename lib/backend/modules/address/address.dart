class Address {
  late String cep;
  late String state;
  late String city;
  late String neighborhood;
  late String street;
  late String service;

  Address(
      {required this.cep,
      required this.state,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.service});

  Address.fromJson(Map<String, dynamic> json) {
    cep = json['cep'] ?? '';
    state = json['state'] ?? '';
    city = json['city'] ?? '';
    neighborhood = json['neighborhood'] ?? '';
    street = json['street'] ?? '';
    service = json['service'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['state'] = this.state;
    data['city'] = this.city;
    data['neighborhood'] = this.neighborhood;
    data['street'] = this.street;
    data['service'] = this.service;
    return data;
  }
}