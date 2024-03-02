import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://pruebaflutter12.azurewebsites.net/api';

  static Future<List<dynamic>> getViajes() async {
    final response = await http.get(Uri.parse('$baseUrl/viajes'));
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load viajes');
    }
  }

  static Future<List<dynamic>> getPromociones() async {
    final response = await http.get(Uri.parse('$baseUrl/promociones'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load promociones');
    }
  }

  static Future<List<dynamic>> getConductores() async {
    final response = await http.get(Uri.parse('$baseUrl/conductores'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load conductores');
    }
  }
}
