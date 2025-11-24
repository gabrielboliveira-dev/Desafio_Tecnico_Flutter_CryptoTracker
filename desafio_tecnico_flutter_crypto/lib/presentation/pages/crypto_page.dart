import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/crypto_cubit.dart';
import '../cubit/crypto_state.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Tracker')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Pesquisar Moeda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<CryptoCubit>().filterCryptos(value);
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<CryptoCubit, CryptoState>(
              builder: (context, state) {
                if (state is CryptoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CryptoLoaded) {
                  if (state.displayCryptos.isEmpty) {
                    return const Center(
                      child: Text("Nenhuma moeda encontrada."),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.displayCryptos.length,
                    itemBuilder: (context, index) {
                      final crypto = state.displayCryptos[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(crypto.symbol.toUpperCase()),
                        ),
                        title: Text(crypto.name),
                        subtitle: Text(
                          '\$${crypto.currentPrice.toStringAsFixed(2)}',
                        ),
                        trailing: Text(
                          '${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: crypto.priceChangePercentage24h >= 0
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is CryptoError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
