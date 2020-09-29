import 'package:equatable/equatable.dart';

class BaseHttpResponse extends Equatable {
  final int statusCode;
  final Map<dynamic, dynamic> json;

  BaseHttpResponse({this.statusCode, this.json});

  @override
  List<Object> get props => throw UnimplementedError();
}
