import '../../domain/entities/crypto_entity.dart';

abstract class CryptoState {}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final List<CryptoEntity> cryptos;
  CryptoLoaded(this.cryptos);
}

class CryptoError extends CryptoState {
  final List<CryptoEntity> originalCryptos;
  final List<CryptoEntity> displayCryptos;

  CryptoLoaded({required this.originalCryptos, required this.displayCryptos});
}
