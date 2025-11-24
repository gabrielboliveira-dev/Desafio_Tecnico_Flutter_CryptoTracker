import '../../domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({
    required String id,
    required String symbol,
    required String name,
    required double currentPrice,
    required double marketCap,
    required double priceChangePercentage24h,
  }) : super(
         id: id,
         symbol: symbol,
         name: name,
         currentPrice: currentPrice,
         marketCap: marketCap,
         priceChangePercentage24h: priceChangePercentage24h,
       );

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],

      currentPrice: (json['current_price'] as num).toDouble(),
      marketCap: (json['market_cap'] as num).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num)
          .toDouble(),
    );
  }
}
