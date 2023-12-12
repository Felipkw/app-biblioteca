import 'dart:convert';
import 'package:app_biblioteca/backend/modules/address/address.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddressApi {
  findAddressByCep(String cep) async {
    // url => 'https://brasilapi.com.br/api/cep/v1/{cep}';
    Uri url = Uri.https('brasilapi.com.br', 'api/cep/v1/$cep');
    Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Address address = Address.fromJson(json);

      return address;
    }

    return null;
  }
}