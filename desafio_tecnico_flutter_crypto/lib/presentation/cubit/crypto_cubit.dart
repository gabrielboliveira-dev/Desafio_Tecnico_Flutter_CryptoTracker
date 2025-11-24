import 'package:flutter_bloc/flutter_bloc.dart';
import 'crypto_state.dart';
import '../../domain/usecases/get_top_cryptos_usecase.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final IGetTopCryptosUseCase getTopCryptosUseCase;

  CryptoCubit({required this.getTopCryptosUseCase}) : super(CryptoInitial());

  Future<void> loadCryptos() async {
    emit(CryptoLoading());
    try {
      final cryptos = await getTopCryptosUseCase();
      emit(CryptoLoaded(originalCryptos: cryptos, displayCryptos: cryptos));
    } catch (e) {
      emit(CryptoError("Falha ao carregar moedas."));
    }
  }

  void filterCryptos(String query) {
    if (state is CryptoLoaded) {
      final currentState = state as CryptoLoaded;

      if (query.isEmpty) {
        emit(
          CryptoLoaded(
            originalCryptos: currentState.originalCryptos,
            displayCryptos: currentState.originalCryptos,
          ),
        );
        return;
      }

      final filteredList = currentState.originalCryptos.where((crypto) {
        return crypto.name.toLowerCase().contains(query.toLowerCase()) ||
            crypto.symbol.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(
        CryptoLoaded(
          originalCryptos: currentState.originalCryptos,
          displayCryptos: filteredList,
        ),
      );
    }
  }
}
