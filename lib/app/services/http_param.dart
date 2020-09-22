class HttpParam {
  HttpParamType type;

  Map<String, dynamic> _data = new Map();

  HttpParam.query() {
    this.type = HttpParamType.Query;
  }

  HttpParam.body() {
    this.type = HttpParamType.Query;
  }

  void add(String key, dynamic value) {
    this._data[key] = value.toString();
  }

  Map<String, dynamic> toData() {
    return _data;
  }

  String toQuery() {
    var url = "?";
    _data.forEach((k, v) {
      url += k + "=" + v + "&";
    });
    return url;
  }
}

enum HttpParamType { Body, Query }

