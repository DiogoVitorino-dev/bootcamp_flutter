import 'dart:convert';
import 'dart:io';

import 'package:bootcamp_flutter/models/ViaCepModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepRepository {
  Future<ViaCepModel?> consultarCep(String cep) async {
    var domain = dotenv.get("VIACEPURL");
    if (domain.isEmpty) {
      throw "MISSING VIACEPURL VALUE AT ENVIRONMENT VARIABLES";
    }

    Uri url = Uri.parse("$domain/${cep.trim()}/json/");
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      return ViaCepModel.fromJson(jsonDecode(response.body));
    }

    return null;
  }
}
