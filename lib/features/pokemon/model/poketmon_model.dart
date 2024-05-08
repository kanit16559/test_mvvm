
class PoKetMonModel {
  String name;
  String url;

  PoKetMonModel({
    required this.name,
    required this.url,
  });

  factory PoKetMonModel.fromJson(Map<String, dynamic> json) => PoKetMonModel(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}