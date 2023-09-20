import 'dart:convert';
import 'dart:io';

import 'package:bootcamp_flutter/models/ViaCepModel.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {

   Future<ViaCepModel?> consultarCep(String cep) async {
    Uri url = Uri.parse("https://viacep.com.br/ws/${cep.trim()}/json/");
    var response = await http.get(url);   

    if (response.statusCode == HttpStatus.ok) {
      return ViaCepModel.fromJson(jsonDecode(response.body));
    }

    return null;
  }
}