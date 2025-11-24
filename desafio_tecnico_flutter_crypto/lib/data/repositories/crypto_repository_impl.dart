import '../../domain/entities/crypto_entity.dart';
import '../../domain/repositories/crypto_repository.dart';
import '../datasources/crypto_datasource.dart';

class CryptoRepositoryImpl implements ICryptoRepository {
  final ICryptoDataSource dataSource;

  CryptoRepositoryImpl(this.dataSource);

  @override
  Future<List<CryptoEntity>> getTopCryptocurrencies() async {
    try {
      final models = await dataSource.getAllCryptos();
      return models;
    } catch (e) {
      rethrow;
    }
  }
}
