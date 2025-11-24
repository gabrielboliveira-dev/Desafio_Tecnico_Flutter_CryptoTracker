class CryptoEntity {
  final String id;
  final String symbol;
  final String name;
  final double currentPrice;
  final double marketCap;
  final double priceChangePercentage24h;

  CryptoEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.marketCap,
    required this.priceChangePercentage24h,
  });
}
