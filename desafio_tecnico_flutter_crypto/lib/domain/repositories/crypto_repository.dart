import '../entities/crypto_entity.dart';

abstract class ICryptoRepository {
  Future<List<CryptoEntity>> getTopCryptocurrencies();
}
