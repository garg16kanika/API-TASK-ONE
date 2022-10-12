import 'dart:convert';

DataNew dataNewFromJson(String str) => DataNew.fromJson(json.decode(str));

String dataNewToJson(DataNew data) => json.encode(data.toJson());

class DataNew {
  DataNew({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
    required this.symbol,
  });

  String id;

  String name;
  String code;
  int status;
  String symbol;

  factory DataNew.fromJson(Map<String, dynamic> json) => DataNew(
        id: json["_id"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "code": code,
        "status": status,
        "symbol": symbol,
      };
}
