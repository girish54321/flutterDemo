class Records {
  Records({this.status, this.message, this.data, this.error});

  final int status;
  final String message;
  final Data data;
  final String error;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.totalRecords,
    this.records,
  });

  final int totalRecords;
  final List<Record> records;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalRecords: json["TotalRecords"],
        records:
            List<Record>.from(json["Records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    this.id,
    this.title,
    this.shortDescription,
    this.collectedValue,
    this.totalValue,
    this.startDate,
    this.endDate,
    this.mainImageUrl,
  });

  final int id;
  final String title;
  final String shortDescription;
  final int collectedValue;
  final int totalValue;
  final String startDate;
  final String endDate;
  final String mainImageUrl;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["Id"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        collectedValue: json["collectedValue"],
        totalValue: json["totalValue"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        mainImageUrl: json["mainImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "title": title,
        "shortDescription": shortDescription,
        "collectedValue": collectedValue,
        "totalValue": totalValue,
        "startDate": startDate,
        "endDate": endDate,
        "mainImageURL": mainImageUrl,
      };
}
