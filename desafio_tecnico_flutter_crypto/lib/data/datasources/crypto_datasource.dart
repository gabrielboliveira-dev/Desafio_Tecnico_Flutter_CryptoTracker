import '../models/crypto_model.dart';

abstract class ICryptoDataSource {
  Future<List<CryptoModel>> getAllCryptos();
}
