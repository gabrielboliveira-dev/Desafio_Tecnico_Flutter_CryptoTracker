import 'dart:convert';
import 'package:http/http.dart' as http;
import '../crypto_datasource.dart';
import '../../models/crypto_model.dart';

class CryptoDataSourceImpl implements ICryptoDataSource {
  final http.Client client;

  CryptoDataSourceImpl({required this.client});

  @override
  Future<List<CryptoModel>> getAllCryptos() async {
    final response = await client.get(
      Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false',
      ),
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body);
      return decodedJson.map((json) => CryptoModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar dados da API');
    }
  }
}
