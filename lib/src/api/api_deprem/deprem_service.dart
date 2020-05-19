import 'deprem_model.dart';

import 'package:http/http.dart' as http;

class DepremService {
  Future<List<Deprem>> fetchDeprem() async {
    var response = await http.get(
      Uri.encodeFull("http://deprem.odabas.xyz/api/pure_api.php"),
      headers: {"Accept": "application/json"},
    );
    return depremFromJson(response.body);
  }
}