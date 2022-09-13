// ignore_for_file: non_constant_identifier_names

class Transaction {
  late final int id;
  late final String amount;
  late final String source;
  late final String created_at;

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        amount = json['amount'] ?? '',
        source = json['source'] ?? '',
        created_at = json['created_at'] ?? '';
}
