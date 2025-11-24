import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/remote/crypto_datasource_impl.dart';
import 'data/repositories/crypto_repository_impl.dart';
import 'domain/usecases/get_top_cryptos_usecase.dart';
import 'presentation/cubit/crypto_cubit.dart';
import 'presentation/pages/crypto_page.dart';

void main() {
  final client = http.Client();

  final dataSource = CryptoDataSourceImpl(client: client);
  final repository = CryptoRepositoryImpl(dataSource);
  final useCase = GetTopCryptosUseCase(repository);

  runApp(MyApp(getTopCryptosUseCase: useCase));
}

class MyApp extends StatelessWidget {
  final GetTopCryptosUseCase getTopCryptosUseCase;

  const MyApp({super.key, required this.getTopCryptosUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Clean',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: BlocProvider(
        create: (context) =>
            CryptoCubit(getTopCryptosUseCase: getTopCryptosUseCase)
              ..loadCryptos(),
        child: const CryptoPage(),
      ),
    );
  }
}
