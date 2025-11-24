import '../entities/crypto_entity.dart';
import '../repositories/crypto_repository.dart';

abstract class IGetTopCryptosUseCase {
  Future<List<CryptoEntity>> call();
}

class GetTopCryptosUseCase implements IGetTopCryptosUseCase {
  final ICryptoRepository repository;

  GetTopCryptosUseCase(this.repository);

  @override
  Future<List<CryptoEntity>> call() async {
    return await repository.getTopCryptocurrencies();
  }
}
