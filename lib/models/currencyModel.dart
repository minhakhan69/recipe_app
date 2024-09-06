class CurrencyModel {
  CurrencyModel({
    List<Data>? data,}){
    _data = data;
  }

  CurrencyModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;
  CurrencyModel copyWith({  List<Data>? data,
  }) => CurrencyModel(  data: data ?? _data,
  );
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "AED"
/// name : "United Arab Emirates Dirham"
/// min_size : "0.01"

class Data {
  Data({
    String? id,
    String? name,
    String? minSize,}){
    _id = id;
    _name = name;
    _minSize = minSize;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _minSize = json['min_size'];
  }
  String? _id;
  String? _name;
  String? _minSize;
  Data copyWith({  String? id,
    String? name,
    String? minSize,
  }) => Data(  id: id ?? _id,
    name: name ?? _name,
    minSize: minSize ?? _minSize,
  );
  String? get id => _id;
  String? get name => _name;
  String? get minSize => _minSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['min_size'] = _minSize;
    return map;
  }

}